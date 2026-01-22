# 🔧 Correção de Configurações Duplicadas

## Problema Identificado

No painel administrativo, nas abas **Contato** and **Redes Sociais**, existem campos duplicados que não têm função. Após análise do código, identifiquei que apenas os seguintes campos são realmente utilizados:

### ✅ Campos que FUNCIONAM (mantidos):
- **whatsapp** - Telefone/WhatsApp usado em todo o site
- **email** - E-mail de contato usado em todo o site  
- **address** - Endereço usado em todo o site
- **instagram_url** - Link do Instagram (usado no rodapé)
- **facebook_url** - Link do Facebook (usado no rodapé)

### ❌ Campos DUPLICADOS (serão removidos):
- Campos extras de WhatsApp, e-mail, Instagram e Facebook que não são utilizados no código

## 🚀 Como Corrigir

### Passo 1: Criar a tabela (se não existir)
1. Acesse seu painel do **Supabase**
2. Vá em **SQL Editor**
3. Execute o conteúdo do arquivo `create-site-settings-table.sql`

### Passo 2: Limpar duplicatas
1. No mesmo **SQL Editor** do Supabase
2. Execute o conteúdo do arquivo `fix-duplicate-settings.sql`
3. Isso vai:
   - Remover todas as configurações duplicadas
   - Manter apenas os campos que realmente funcionam
   - Organizar por categorias corretas

### Passo 3: Verificar resultado
Após executar os scripts, no painel administrativo você terá:

**Aba Contato:**
- ✅ Telefone / WhatsApp
- ✅ E-mail de Contato  
- ✅ Endereço

**Aba Redes Sociais:**
- ✅ Instagram URL
- ✅ Facebook URL

**Aba SEO:**
- ✅ Título SEO
- ✅ Descrição SEO
- ✅ Palavras-chave SEO
- ✅ Imagem OG

**Aba Marketing:**
- ✅ Google Analytics ID
- ✅ Facebook Pixel ID
- ✅ Google Tag Manager ID

## ✨ Resultado Final

- ❌ **Sem mais duplicatas**
- ✅ **Apenas campos funcionais**
- ✅ **Interface limpa e organizada**
- ✅ **Todos os campos conectados ao site**

## 🔍 Como Verificar se Funcionou

1. Acesse o painel administrativo (`admin.html`)
2. Vá na aba **Configurações**
3. Teste cada aba (SEO, Marketing, Contato, Redes Sociais)
4. Edite um campo e salve
5. Verifique se a alteração aparece no site

---

**Nota:** Todos os campos mantidos são utilizados ativamente no site. Os campos removidos eram duplicatas sem função.