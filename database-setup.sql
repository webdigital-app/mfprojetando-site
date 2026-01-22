-- MF Projetando Database Setup
-- Execute these commands in your Supabase SQL Editor

-- Create page_content table for editable website content
CREATE TABLE IF NOT EXISTS page_content (
    id SERIAL PRIMARY KEY,
    key VARCHAR(100) UNIQUE NOT NULL,
    value TEXT,
    label VARCHAR(200) NOT NULL,
    page VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert default content for all pages
INSERT INTO page_content (key, value, label, page) VALUES
-- HOME PAGE
('hero_tagline', 'Design de Interiores & Móveis Planejados', 'Tagline do Hero', 'home'),
('hero_titulo', 'Transformando Espaços<br>em <em>Experiências</em>', 'Título Principal', 'home'),
('hero_subtitulo', 'Projetos exclusivos que unem beleza, funcionalidade e personalidade.', 'Subtítulo do Hero', 'home'),

-- SOBRE PAGE
('sobre_tagline', 'Nossa História', 'Tagline da Página Sobre', 'sobre'),
('sobre_titulo', 'Criamos Ambientes que <em>Contam Histórias</em>', 'Título da Página Sobre', 'sobre'),
('sobre_subtitulo', 'Há mais de 5 anos transformando sonhos em realidade através do design de interiores.', 'Subtítulo da Página Sobre', 'sobre'),
('sobre_secao_tagline', 'Quem Somos', 'Tagline da Seção', 'sobre'),
('sobre_secao_titulo', 'Nossa <em>Missão</em>', 'Título da Seção', 'sobre'),
('sobre_paragrafo_1', 'Há mais de 5 anos no mercado, a MF Projetando transforma sonhos em realidade. Somos especialistas em criar espaços que refletem a essência de cada cliente, unindo estética contemporânea à funcionalidade inteligente.', 'Primeiro Parágrafo', 'sobre'),
('sobre_paragrafo_2', 'Nosso diferencial está na escuta atenta e no compromisso com cada detalhe — do primeiro traço à entrega final.', 'Segundo Parágrafo', 'sobre'),
('stat_projetos', '150+', 'Estatística - Projetos', 'sobre'),
('stat_satisfacao', '98%', 'Estatística - Satisfação', 'sobre'),
('stat_experiencia', '5', 'Estatística - Anos', 'sobre'),
('sobre_badge', 'Excelência em cada detalhe', 'Badge Flutuante', 'sobre'),
('processo_tagline', 'Metodologia', 'Tagline do Processo', 'sobre'),
('processo_titulo', 'Como Trabalhamos', 'Título do Processo', 'sobre'),
('processo_1_titulo', 'Briefing', 'Processo Etapa 1 - Título', 'sobre'),
('processo_1_descricao', 'Entendemos suas necessidades, estilo de vida e orçamento em uma conversa detalhada.', 'Processo Etapa 1 - Descrição', 'sobre'),
('processo_2_titulo', 'Projeto 3D', 'Processo Etapa 2 - Título', 'sobre'),
('processo_2_descricao', 'Criamos maquetes realistas para você visualizar exatamente como ficará.', 'Processo Etapa 2 - Descrição', 'sobre'),
('processo_3_titulo', 'Detalhamento', 'Processo Etapa 3 - Título', 'sobre'),
('processo_3_descricao', 'Produzimos todos os desenhos técnicos para marcenaria e obra.', 'Processo Etapa 3 - Descrição', 'sobre'),
('processo_4_titulo', 'Execução', 'Processo Etapa 4 - Título', 'sobre'),
('processo_4_descricao', 'Acompanhamos a instalação para garantir o resultado perfeito.', 'Processo Etapa 4 - Descrição', 'sobre'),

-- PROJETOS PAGE
('projetos_tagline', 'Portfólio', 'Tagline da Página Projetos', 'projetos'),
('projetos_titulo', 'Nossos <em>Projetos</em>', 'Título da Página Projetos', 'projetos'),
('projetos_subtitulo', 'Conheça algumas das transformações que realizamos com muito carinho e dedicação.', 'Subtítulo da Página Projetos', 'projetos'),
('projetos_secao_tagline', 'Transformações', 'Tagline da Seção Projetos', 'projetos'),
('projetos_secao_titulo', 'Cada Projeto é <em>Único</em>', 'Título da Seção Projetos', 'projetos'),
('projetos_secao_descricao', 'Desenvolvemos soluções personalizadas que refletem a personalidade e necessidades de cada cliente.', 'Descrição da Seção Projetos', 'projetos'),
('servicos_tagline', 'Nossos Serviços', 'Tagline dos Serviços', 'projetos'),
('servicos_titulo', 'Soluções Completas em Design', 'Título dos Serviços', 'projetos'),
('servico_1_titulo', 'Projetos de Interiores', 'Serviço 1 - Título', 'projetos'),
('servico_1_descricao', 'Desenvolvimento completo de layouts, escolha de revestimentos, iluminação e decoração.', 'Serviço 1 - Descrição', 'projetos'),
('servico_1_item_1', 'Planta Baixa Humanizada', 'Serviço 1 - Item 1', 'projetos'),
('servico_1_item_2', 'Imagens 3D Realistas', 'Serviço 1 - Item 2', 'projetos'),
('servico_1_item_3', 'Detalhamento Técnico', 'Serviço 1 - Item 3', 'projetos'),
('servico_2_titulo', 'Móveis Planejados', 'Serviço 2 - Título', 'projetos'),
('servico_2_descricao', 'Marcenaria sob medida de alto padrão. Otimização inteligente de cada milímetro.', 'Serviço 2 - Descrição', 'projetos'),
('servico_2_item_1', 'Cozinhas & Áreas Gourmet', 'Serviço 2 - Item 1', 'projetos'),
('servico_2_item_2', 'Dormitórios & Closets', 'Serviço 2 - Item 2', 'projetos'),
('servico_2_item_3', 'Home Office & Escritórios', 'Serviço 2 - Item 3', 'projetos'),
('servico_3_titulo', 'Consultoria Online', 'Serviço 3 - Título', 'projetos'),
('servico_3_descricao', 'Solução ágil para quem precisa de direcionamento profissional sem obra pesada.', 'Serviço 3 - Descrição', 'projetos'),
('servico_3_item_1', 'Definição de Estilo', 'Serviço 3 - Item 1', 'projetos'),
('servico_3_item_2', 'Paleta de Cores', 'Serviço 3 - Item 2', 'projetos'),
('servico_3_item_3', 'Lista de Compras', 'Serviço 3 - Item 3', 'projetos'),

-- MÓVEIS PAGE
('moveis_tagline', 'Marcenaria Premium', 'Tagline da Página Móveis', 'moveis'),
('moveis_titulo', 'Móveis <em>Planejados</em>', 'Título da Página Móveis', 'moveis'),
('moveis_subtitulo', 'Marcenaria sob medida de alto padrão. Trabalhamos com materiais de primeira linha para entregar móveis que duram uma vida.', 'Subtítulo da Página Móveis', 'moveis'),
('moveis_secao_tagline', 'Excelência', 'Tagline da Seção Móveis', 'moveis'),
('moveis_secao_titulo', 'Qualidade <em>Premium</em>', 'Título da Seção Móveis', 'moveis'),
('moveis_paragrafo_1', 'A excelência da marcenaria sob medida. Trabalhamos com materiais de primeira linha para entregar móveis que duram uma vida.', 'Primeiro Parágrafo Móveis', 'moveis'),
('moveis_paragrafo_2', 'Cada projeto é desenvolvido pensando na funcionalidade e beleza, aproveitando cada centímetro do seu espaço.', 'Segundo Parágrafo Móveis', 'moveis'),
('moveis_item_1', 'Acabamento Premium', 'Item 1 - Móveis', 'moveis'),
('moveis_item_2', 'Projetos 100% Personalizados', 'Item 2 - Móveis', 'moveis'),
('moveis_item_3', 'Garantia e Durabilidade', 'Item 3 - Móveis', 'moveis'),
('moveis_item_4', 'Variedade de Materiais e Cores', 'Item 4 - Móveis', 'moveis'),
('categorias_tagline', 'Categorias', 'Tagline das Categorias', 'moveis'),
('categorias_titulo', 'Ambientes que <em>Transformamos</em>', 'Título das Categorias', 'moveis'),
('categorias_descricao', 'Desenvolvemos móveis planejados para todos os ambientes da sua casa ou escritório.', 'Descrição das Categorias', 'moveis'),
('categoria_1_titulo', 'Cozinhas & Áreas Gourmet', 'Categoria 1 - Título', 'moveis'),
('categoria_1_descricao', 'Projetos funcionais que otimizam o espaço e facilitam o dia a dia na cozinha.', 'Categoria 1 - Descrição', 'moveis'),
('categoria_1_item_1', 'Armários Sob Medida', 'Categoria 1 - Item 1', 'moveis'),
('categoria_1_item_2', 'Bancadas Personalizadas', 'Categoria 1 - Item 2', 'moveis'),
('categoria_1_item_3', 'Ilhas e Peninsulas', 'Categoria 1 - Item 3', 'moveis'),
('categoria_2_titulo', 'Dormitórios & Closets', 'Categoria 2 - Título', 'moveis'),
('categoria_2_descricao', 'Ambientes de descanso com máximo aproveitamento e organização inteligente.', 'Categoria 2 - Descrição', 'moveis'),
('categoria_2_item_1', 'Guarda-roupas Planejados', 'Categoria 2 - Item 1', 'moveis'),
('categoria_2_item_2', 'Closets Personalizados', 'Categoria 2 - Item 2', 'moveis'),
('categoria_2_item_3', 'Cabeceiras e Criados', 'Categoria 2 - Item 3', 'moveis'),
('categoria_3_titulo', 'Home Office & Escritórios', 'Categoria 3 - Título', 'moveis'),
('categoria_3_descricao', 'Espaços de trabalho produtivos e organizados para o seu dia a dia profissional.', 'Categoria 3 - Descrição', 'moveis'),
('categoria_3_item_1', 'Mesas de Trabalho', 'Categoria 3 - Item 1', 'moveis'),
('categoria_3_item_2', 'Estantes e Prateleiras', 'Categoria 3 - Item 2', 'moveis'),
('categoria_3_item_3', 'Armários para Arquivo', 'Categoria 3 - Item 3', 'moveis'),
('processo_moveis_tagline', 'Processo', 'Tagline do Processo Móveis', 'moveis'),
('processo_moveis_titulo', 'Do Projeto à <em>Instalação</em>', 'Título do Processo Móveis', 'moveis'),
('processo_moveis_1_titulo', 'Medição', 'Processo Móveis 1 - Título', 'moveis'),
('processo_moveis_1_descricao', 'Visitamos o local para medições precisas e análise do espaço disponível.', 'Processo Móveis 1 - Descrição', 'moveis'),
('processo_moveis_2_titulo', 'Projeto 3D', 'Processo Móveis 2 - Título', 'moveis'),
('processo_moveis_2_descricao', 'Desenvolvemos o projeto em 3D para você visualizar o resultado final.', 'Processo Móveis 2 - Descrição', 'moveis'),
('processo_moveis_3_titulo', 'Produção', 'Processo Móveis 3 - Título', 'moveis'),
('processo_moveis_3_descricao', 'Fabricação com materiais premium e acabamento de alta qualidade.', 'Processo Móveis 3 - Descrição', 'moveis'),
('processo_moveis_4_titulo', 'Instalação', 'Processo Móveis 4 - Título', 'moveis'),
('processo_moveis_4_descricao', 'Montagem profissional e entrega do projeto finalizado.', 'Processo Móveis 4 - Descrição', 'moveis'),
('depoimentos_moveis_tagline', 'Depoimentos', 'Tagline dos Depoimentos Móveis', 'moveis'),
('depoimentos_moveis_titulo', 'O Que Nossos Clientes Dizem', 'Título dos Depoimentos Móveis', 'moveis'),
('depoimento_moveis_1_texto', 'Os móveis planejados ficaram perfeitos! Aproveitaram cada cantinho da minha cozinha. Recomendo demais!', 'Depoimento Móveis 1 - Texto', 'moveis'),
('depoimento_moveis_1_nome', 'Maria Aparecida', 'Depoimento Móveis 1 - Nome', 'moveis'),
('depoimento_moveis_1_projeto', 'Cozinha Planejada', 'Depoimento Móveis 1 - Projeto', 'moveis'),
('depoimento_moveis_2_texto', 'Meu closet ficou um sonho! Organização perfeita e acabamento impecável. Superou minhas expectativas.', 'Depoimento Móveis 2 - Texto', 'moveis'),
('depoimento_moveis_2_nome', 'Roberto Santos', 'Depoimento Móveis 2 - Nome', 'moveis'),
('depoimento_moveis_2_projeto', 'Closet Personalizado', 'Depoimento Móveis 2 - Projeto', 'moveis'),
('depoimento_moveis_3_texto', 'Home office dos sonhos! Funcional, bonito e com muito espaço para organização. Trabalho muito melhor agora.', 'Depoimento Móveis 3 - Texto', 'moveis'),
('depoimento_moveis_3_nome', 'Juliana Lima', 'Depoimento Móveis 3 - Nome', 'moveis'),
('depoimento_moveis_3_projeto', 'Home Office', 'Depoimento Móveis 3 - Projeto', 'moveis'),

-- CONTATO PAGE
('contato_tagline', 'Contato', 'Tagline da Página Contato', 'contato'),
('contato_titulo', 'Vamos <em>Conversar?</em>', 'Título da Página Contato', 'contato'),
('contato_subtitulo', 'Entre em contato e agende uma consultoria inicial. Estamos prontos para transformar seu espaço.', 'Subtítulo da Página Contato', 'contato'),
('contato_info_tagline', 'Fale Conosco', 'Tagline das Informações', 'contato'),
('contato_info_titulo', 'Estamos <em>Aqui</em>', 'Título das Informações', 'contato'),
('contato_info_descricao', 'Nossa equipe está pronta para atender você e transformar seus sonhos em realidade. Entre em contato através dos canais abaixo.', 'Descrição das Informações', 'contato'),
('horario_atendimento', 'Segunda a Sexta: 8h às 18h<br>Sábado: 8h às 12h', 'Horário de Atendimento', 'contato'),
('formulario_titulo', 'Solicite seu Orçamento', 'Título do Formulário', 'contato'),
('formulario_descricao', 'Preencha o formulário abaixo e entraremos em contato em breve.', 'Descrição do Formulário', 'contato'),
('faq_tagline', 'Dúvidas Frequentes', 'Tagline do FAQ', 'contato'),
('faq_titulo', 'Perguntas <em>Frequentes</em>', 'Título do FAQ', 'contato'),
('faq_descricao', 'Esclarecemos as principais dúvidas sobre nossos serviços.', 'Descrição do FAQ', 'contato'),
('faq_1_pergunta', 'Qual o prazo para entrega de um projeto?', 'FAQ 1 - Pergunta', 'contato'),
('faq_1_resposta', 'O prazo varia conforme a complexidade do projeto. Projetos de interiores ficam prontos em 15-30 dias, enquanto móveis planejados podem levar de 30-60 dias após aprovação.', 'FAQ 1 - Resposta', 'contato'),
('faq_2_pergunta', 'Vocês atendem em outras cidades?', 'FAQ 2 - Pergunta', 'contato'),
('faq_2_resposta', 'Sim! Atendemos Campo Grande e região metropolitana. Para outras cidades, consulte disponibilidade e condições especiais.', 'FAQ 2 - Resposta', 'contato'),
('faq_3_pergunta', 'Como funciona o orçamento?', 'FAQ 3 - Pergunta', 'contato'),
('faq_3_resposta', 'O orçamento é gratuito! Fazemos uma visita técnica, entendemos suas necessidades e apresentamos uma proposta personalizada sem compromisso.', 'FAQ 3 - Resposta', 'contato'),
('faq_4_pergunta', 'Oferecem garantia nos móveis?', 'FAQ 4 - Pergunta', 'contato'),
('faq_4_resposta', 'Sim! Todos os nossos móveis planejados têm garantia de 1 ano contra defeitos de fabricação e 6 meses para ajustes de instalação.', 'FAQ 4 - Resposta', 'contato')

ON CONFLICT (key) DO NOTHING;

-- Create trigger to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_page_content_updated_at 
    BEFORE UPDATE ON page_content 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security (RLS)
ALTER TABLE page_content ENABLE ROW LEVEL SECURITY;

-- Create policies for page_content
CREATE POLICY "Allow public read access" ON page_content FOR SELECT USING (true);
CREATE POLICY "Allow authenticated users to update" ON page_content FOR UPDATE USING (auth.role() = 'authenticated');

-- Grant permissions
GRANT SELECT ON page_content TO anon;
GRANT ALL ON page_content TO authenticated;
GRANT USAGE ON SEQUENCE page_content_id_seq TO authenticated;