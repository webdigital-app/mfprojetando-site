-- Fix Duplicate Settings - Remove unused configurations
-- Execute this in your Supabase SQL Editor

-- First, let's see what we currently have (optional - for debugging)
-- SELECT * FROM site_settings ORDER BY category, key;

-- Delete all existing site_settings to start fresh
DELETE FROM site_settings;

-- Insert only the settings that are actually used in the code
INSERT INTO site_settings (key, value, label, category, created_at, updated_at) VALUES
-- CONTATO (Contact Information)
('whatsapp', '(67) 99335-5026', 'Telefone / WhatsApp', 'Contato', NOW(), NOW()),
('email', 'contato@mfprojetando.com', 'E-mail de Contato', 'Contato', NOW(), NOW()),
('address', 'Campo Grande - MS', 'Endereço', 'Contato', NOW(), NOW()),

-- REDES SOCIAIS (Social Media)
('instagram_url', 'https://instagram.com/mfprojetando', 'Instagram URL', 'Redes Sociais', NOW(), NOW()),
('facebook_url', 'https://facebook.com/mfprojetando', 'Facebook URL', 'Redes Sociais', NOW(), NOW()),

-- SEO
('site_title', 'MF Projetando | Design de Interiores e Móveis Planejados em Campo Grande MS', 'Título SEO', 'SEO', NOW(), NOW()),
('site_description', 'Design de Interiores, Projetos Exclusivos e Móveis Planejados em Campo Grande MS. Transforme seu espaço com elegância e funcionalidade. Orçamento grátis!', 'Descrição SEO', 'SEO', NOW(), NOW()),
('site_keywords', 'design de interiores, móveis planejados, projeto de interiores, decoração, arquitetura, campo grande, ms, móveis sob medida, marcenaria, cozinha planejada', 'Palavras-chave SEO', 'SEO', NOW(), NOW()),
('og_image', 'https://mfprojetando.webdigital.app/assets/images/hero.png', 'Imagem OG (Compartilhamento)', 'SEO', NOW(), NOW()),

-- MARKETING
('google_analytics', '', 'Google Analytics ID', 'Marketing', NOW(), NOW()),
('facebook_pixel', '', 'Facebook Pixel ID', 'Marketing', NOW(), NOW()),
('google_tag_manager', '', 'Google Tag Manager ID', 'Marketing', NOW(), NOW())

ON CONFLICT (key) DO UPDATE SET
    value = EXCLUDED.value,
    label = EXCLUDED.label,
    category = EXCLUDED.category,
    updated_at = NOW();

-- Verify the results
SELECT key, label, category FROM site_settings ORDER BY category, key;