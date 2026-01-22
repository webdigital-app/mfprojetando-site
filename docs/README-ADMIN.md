# MF Projetando - Sistema de Administração

## 🎯 Visão Geral

O site da MF Projetando agora possui um sistema completo de administração que permite:

- **Páginas Separadas**: Cada item do menu tem sua própria página (Início, Sobre, Projetos, Móveis, Contato)
- **Edição de Conteúdo**: Todos os textos do site podem ser editados através do painel administrativo
- **Gerenciamento de Projetos**: Adicionar, editar e remover projetos do portfólio
- **Configurações**: Gerenciar informações de contato, SEO e redes sociais

## 📁 Estrutura do Site

```
├── index.html          # Página inicial
├── sobre.html          # Página sobre a empresa
├── projetos.html       # Página de projetos/portfólio
├── moveis.html         # Página de móveis planejados
├── contato.html        # Página de contato
├── admin.html          # Painel administrativo
├── style.css           # Estilos principais
├── main.js             # JavaScript da página inicial
├── js/
│   ├── page-loader.js  # JavaScript das páginas individuais
│   ├── supabase.js     # Configuração do banco
│   └── services/       # Serviços de API
└── database-setup.sql  # Script de configuração do banco
```

## 🚀 Como Configurar

### 1. Configurar o Banco de Dados

1. Acesse seu painel do Supabase
2. Vá em **SQL Editor**
3. Execute o conteúdo do arquivo `database-setup.sql`
4. Isso criará a tabela `page_content` com todo o conteúdo editável

### 2. Configurar Variáveis de Ambiente

Certifique-se de que o arquivo `.env` contém:

```env
VITE_SUPABASE_URL=sua_url_do_supabase
VITE_SUPABASE_ANON_KEY=sua_chave_anonima
```

### 3. Acessar o Painel Administrativo

1. Acesse `admin.html` no seu navegador
2. Faça login com suas credenciais do Supabase
3. Comece a gerenciar o conteúdo!

## 🎨 Cor Principal Atualizada

A cor principal do site foi alterada para **#610031** (vinho/bordô), aplicada em:
- Logotipo
- Botões principais
- Elementos de destaque
- Links e ícones

## 📝 Como Usar o Painel Administrativo

### Dashboard
- Visão geral do site
- Estatísticas básicas
- Ações rápidas

### Projetos
- Adicionar novos projetos ao portfólio
- Editar projetos existentes
- Remover projetos
- Upload de imagens

### Conteúdo das Páginas
- **Início**: Editar hero, seções principais
- **Sobre**: Editar história, processo, estatísticas
- **Projetos**: Editar títulos, descrições, serviços
- **Móveis**: Editar categorias, processo, depoimentos
- **Contato**: Editar informações, FAQ, formulário

### Configurações
- **SEO**: Meta títulos, descrições, palavras-chave
- **Marketing**: Google Analytics, Facebook Pixel
- **Contato**: Telefone, e-mail, endereço
- **Redes Sociais**: Links do Instagram, Facebook

## 🔧 Funcionalidades Técnicas

### Sistema de Conteúdo Dinâmico
- Todos os textos são carregados do banco de dados
- Fallback para conteúdo estático se o banco não estiver disponível
- Atualização em tempo real após edições

### Responsividade
- Design totalmente responsivo
- Menu mobile funcional
- Otimizado para todos os dispositivos

### SEO Otimizado
- Meta tags personalizáveis
- URLs amigáveis
- Estrutura semântica
- Schema.org markup

### Performance
- Carregamento otimizado
- Imagens responsivas
- CSS e JS minificados

## 🎯 Dicas de Uso

### Para Editar Conteúdo:
1. Acesse o painel administrativo
2. Vá na aba "Conteúdo das Páginas"
3. Selecione a página que deseja editar
4. Faça as alterações nos campos
5. Clique em "Salvar Tudo"

### Para Adicionar Projetos:
1. Vá na aba "Projetos"
2. Clique em "Novo Projeto"
3. Preencha título, descrição e URL da imagem
4. Salve o projeto

### Para Configurar SEO:
1. Vá na aba "Configurações"
2. Selecione "SEO"
3. Edite títulos e descrições
4. Salve as alterações

## 🔒 Segurança

- Autenticação via Supabase
- Row Level Security (RLS) habilitado
- Acesso público apenas para leitura
- Edição restrita a usuários autenticados

## 📱 Contato e Suporte

Para dúvidas sobre o sistema, entre em contato com a equipe de desenvolvimento.

---

**Desenvolvido por Web Digital** 🚀