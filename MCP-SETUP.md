# 🔧 Configuração MCP (Model Context Protocol)

## 📋 Pré-requisitos

Para usar o MCP com Supabase e GitHub, você precisa:

1. **Token de Acesso Supabase**
2. **Token de Acesso GitHub** (opcional)
3. **Docker** (para GitHub MCP Server)
4. **Node.js** (para Supabase MCP Server)

## 🚀 Como Configurar

### 1. Copiar arquivo de exemplo
```bash
cp .kiro/settings/mcp.json.example .kiro/settings/mcp.json
```

### 2. Obter Token Supabase
1. Acesse [supabase.com](https://supabase.com)
2. Vá em **Settings** → **Access Tokens**
3. Clique em **Generate new token**
4. Copie o token (formato: `sbp_...`)

### 3. Obter Token GitHub (opcional)
1. Acesse [github.com/settings/tokens](https://github.com/settings/tokens)
2. Clique em **Generate new token (classic)**
3. Selecione os escopos necessários
4. Copie o token (formato: `ghp_...`)

### 4. Editar configuração
Abra `.kiro/settings/mcp.json` e substitua:
- `YOUR_SUPABASE_ACCESS_TOKEN_HERE` pelo seu token Supabase
- `YOUR_GITHUB_TOKEN_HERE` pelo seu token GitHub

## ⚠️ Segurança

- **NUNCA** commite tokens no Git
- O arquivo `.kiro/settings/mcp.json` está no `.gitignore`
- Use apenas tokens com permissões mínimas necessárias

## 🔍 Verificar Configuração

Após configurar, teste se está funcionando:
1. Reinicie o Kiro
2. Os servidores MCP devem aparecer conectados
3. Você poderá usar comandos como listar projetos Supabase