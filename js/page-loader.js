// Page Content Loader - Loads dynamic content for individual pages
import { getProjects } from './services/projectService.js';
import { getSettings, getPageContent } from './services/settingsService.js';

document.addEventListener('DOMContentLoaded', () => {
  // ========================================
  // HEADER SCROLL EFFECT
  // ========================================
  const header = document.getElementById('header');

  const handleScroll = () => {
    if (window.scrollY > 50) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  };

  window.addEventListener('scroll', handleScroll);
  handleScroll(); // Check on load

  // ========================================
  // MOBILE MENU
  // ========================================
  const mobileMenuBtn = document.getElementById('mobile-menu-btn');
  const navList = document.querySelector('.nav-list');
  const menuOverlay = document.getElementById('menu-overlay');

  const toggleMenu = () => {
    mobileMenuBtn?.classList.toggle('active');
    navList?.classList.toggle('active');
    menuOverlay?.classList.toggle('active');
    document.body.style.overflow = navList?.classList.contains('active') ? 'hidden' : '';
  };

  mobileMenuBtn?.addEventListener('click', toggleMenu);
  menuOverlay?.addEventListener('click', toggleMenu);

  // Close menu when clicking a link
  navList?.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      mobileMenuBtn?.classList.remove('active');
      navList?.classList.remove('active');
      menuOverlay?.classList.remove('active');
      document.body.style.overflow = '';
    });
  });

  // ========================================
  // SCROLL REVEAL ANIMATIONS
  // ========================================
  const revealElements = document.querySelectorAll('.reveal');

  const revealOnScroll = () => {
    const windowHeight = window.innerHeight;

    revealElements.forEach(element => {
      const elementTop = element.getBoundingClientRect().top;
      const revealPoint = 100;

      if (elementTop < windowHeight - revealPoint) {
        element.classList.add('active');
      }
    });
  };

  window.addEventListener('scroll', revealOnScroll);
  revealOnScroll(); // Check on load

  // ========================================
  // SMOOTH SCROLL FOR ANCHOR LINKS
  // ========================================
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;

      const targetElement = document.querySelector(targetId);
      if (targetElement) {
        e.preventDefault();
        const headerHeight = header.offsetHeight;
        const targetPosition = targetElement.offsetTop - headerHeight;

        window.scrollTo({
          top: targetPosition,
          behavior: 'smooth'
        });
      }
    });
  });

  // ========================================
  // CONTACT FORM HANDLING
  // ========================================
  const contactForm = document.getElementById('contactForm');

  contactForm?.addEventListener('submit', async (e) => {
    e.preventDefault();

    const formData = {
      name: document.getElementById('name').value,
      email: document.getElementById('email').value,
      phone: document.getElementById('phone').value,
      interest: document.getElementById('interest').value,
      message: document.getElementById('message').value
    };

    // Show loading state
    const submitBtn = contactForm.querySelector('button[type="submit"]');
    const originalText = submitBtn.textContent;
    submitBtn.textContent = 'Enviando...';
    submitBtn.disabled = true;

    try {
      // Format message for WhatsApp
      const whatsappMessage = encodeURIComponent(
        `*Nova mensagem do site MF Projetando*\n\n` +
        `*Nome:* ${formData.name}\n` +
        `*E-mail:* ${formData.email}\n` +
        `*Telefone:* ${formData.phone || 'Não informado'}\n` +
        `*Interesse:* ${formData.interest}\n` +
        `*Mensagem:* ${formData.message || 'Não informada'}`
      );

      // Open WhatsApp with the message
      window.open(`https://wa.me/5567993355026?text=${whatsappMessage}`, '_blank');

      // Show success
      submitBtn.textContent = 'Mensagem Enviada! ✓';
      submitBtn.style.background = '#25D366';

      // Reset form
      contactForm.reset();

      setTimeout(() => {
        submitBtn.textContent = originalText;
        submitBtn.style.background = '';
        submitBtn.disabled = false;
      }, 3000);

    } catch (error) {
      console.error('Erro ao enviar:', error);
      submitBtn.textContent = 'Erro ao enviar';
      submitBtn.style.background = '#dc3545';

      setTimeout(() => {
        submitBtn.textContent = originalText;
        submitBtn.style.background = '';
        submitBtn.disabled = false;
      }, 3000);
    }
  });

  // ========================================
  // LOAD DYNAMIC CONTENT
  // ========================================
  loadPageContent();
});

async function loadPageContent() {
  try {
    // Load Projects (for projects page)
    const projectsContainer = document.getElementById('projects-container');
    if (projectsContainer) {
      const projects = await getProjects();
      
      if (projects && projects.length > 0) {
        projectsContainer.innerHTML = projects.map(project => `
          <article class="project-card reveal active">
            <div class="project-image" style="background-image: url('${project.image_url || '/assets/images/hero.png'}')"></div>
            <div class="project-info">
              <span class="project-category">Projeto</span>
              <h3>${project.title}</h3>
              <p>${project.description}</p>
              <a href="#" class="btn-link">Ver Detalhes <span>→</span></a>
            </div>
          </article>
        `).join('');
      }
    }

    // Load Settings (contact info, social links, etc.)
    const settings = await getSettings();
    if (settings && settings.length > 0) {
      settings.forEach(setting => {
        const elements = document.querySelectorAll(`[data-setting="${setting.key}"]`);
        elements.forEach(el => {
          if (el.tagName === 'A') {
            // Se for link do WhatsApp, tratar URL
            if (setting.key === 'whatsapp') {
              const cleanPhone = setting.value.replace(/\D/g, '');
              el.href = `https://wa.me/55${cleanPhone}`;
            } else {
              el.href = setting.value;
            }
          } else if (el.tagName === 'P' || el.tagName === 'SPAN' || el.tagName === 'DIV') {
            el.textContent = setting.value;
          }
        });
      });
    }

    // Load Page Content (editable texts)
    const pageContent = await getPageContent();
    if (pageContent && pageContent.length > 0) {
      pageContent.forEach(content => {
        const elements = document.querySelectorAll(`[data-content="${content.key}"]`);
        elements.forEach(el => {
          if (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA') {
            el.value = content.value;
          } else {
            // Handle HTML content safely
            if (content.value.includes('<br>') || content.value.includes('<em>') || content.value.includes('<strong>')) {
              el.innerHTML = content.value;
            } else {
              el.textContent = content.value;
            }
          }
        });
      });
    }

  } catch (error) {
    console.log('Erro ao carregar conteúdo dinâmico:', error);
    // Site continues to work with static fallback content
  }
}