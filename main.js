
// Mobile Menu Logic
const mobileBtn = document.querySelector('.mobile-menu-btn');
const nav = document.querySelector('.nav');
const navList = document.querySelector('.nav-list');

if (mobileBtn) {
  mobileBtn.addEventListener('click', () => {
    navList.classList.toggle('active');
    mobileBtn.classList.toggle('active');

    // Mobile menu style injection for simplicity
    if (navList.classList.contains('active')) {
      Object.assign(navList.style, {
        display: 'flex',
        flexDirection: 'column',
        position: 'absolute',
        top: '100%',
        left: '0',
        width: '100%',
        backgroundColor: 'white',
        padding: '2rem',
        boxShadow: '0 4px 6px rgba(0,0,0,0.1)',
        borderTop: '1px solid #eee'
      });
    } else {
      navList.style.display = ''; // Reset to CSS default
    }
  });
}

// Smooth Scroll for Anchor Links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    if (this.getAttribute('href') === '#') return;

    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      if (window.innerWidth <= 768 && navList) {
        navList.classList.remove('active');
        navList.style.display = '';
      }

      const headerOffset = 80;
      const elementPosition = target.getBoundingClientRect().top;
      const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

      window.scrollTo({
        top: offsetPosition,
        behavior: "smooth"
      });
    }
  });
});

// Header Scroll Effect
const header = document.querySelector('.header');
window.addEventListener('scroll', () => {
  if (window.scrollY > 50) {
    header.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
  } else {
    header.style.boxShadow = 'none';
  }
});

import { getProjects } from './js/services/projectService.js';
import { getSettings } from './js/services/settingsService.js';

// Load Content Dynamically
async function initContent() {
  try {
    // 1. Projects
    const projects = await getProjects();
    const projectsContainer = document.querySelector('.projects-grid');

    if (projectsContainer && projects && projects.length > 0) {
      projectsContainer.innerHTML = projects.map(project => `
          <article class="project-card">
              <div class="project-image" style="background-image: url('${project.image_url || 'assets/images/hero.png'}')"></div>
              <div class="project-info">
              <h3>${project.title}</h3>
              <p>${project.description}</p>
              <a href="#" class="btn-link">Ver Detalhes</a>
              </div>
          </article>
      `).join('');
    }

    // 2. Settings
    const settings = await getSettings();
    if (settings && settings.length > 0) {
      const settingsMap = settings.reduce((acc, curr) => {
        acc[curr.key] = curr.value;
        return acc;
      }, {});

      // Hero Text
      const heroTitle = document.getElementById('hero-title');
      if (heroTitle && settingsMap.hero_title) heroTitle.innerHTML = settingsMap.hero_title;

      const heroSubtitle = document.getElementById('hero-subtitle');
      if (heroSubtitle && settingsMap.hero_subtitle) heroSubtitle.textContent = settingsMap.hero_subtitle;

      // Socials & Contact
      const updateLink = (selector, url) => {
        document.querySelectorAll(selector).forEach(el => el.href = url || '#');
      };

      updateLink('a[href*="instagram"]', settingsMap.social_instagram);
      updateLink('a[href*="facebook"]', settingsMap.social_facebook);
      // Add more mappings as needed
    }

  } catch (error) {
    console.log('Error initializing content:', error);
  }
}

document.addEventListener('DOMContentLoaded', initContent);
