# MF Projetando - Website Institucional

Project developed for MF Projetando, an interior design and custom furniture office.

## 🚀 Technologies

*   **Frontend**: HTML5, CSS3 (Custom Design System), JavaScript (ES6+)
*   **Build Tool**: Vite
*   **Backend / Database**: Supabase (PostgreSQL)

## 🛠️ Features

*   **Cinematic Hero Section**: Full-screen immersive experience with parallax effects.
*   **Organic Layout**: Modern design using asymmetric grids and organic shape dividers.
*   **Admin Panel**: Custom-built administrative dashboard (`/admin.html`) to manage:
    *   Projects Portfolio (Create, Edit, Delete)
    *   Site Settings (Contact info, Social links, Texts)
*   **Service & Process Showcase**: Detailed sections explaining the workflow and services offered.
*   **WhatsApp Integration**: Floating contact button.

## 📦 Setup & Installation

1.  **Clone the repository**
2.  **Install dependencies**:
    ```bash
    npm install
    ```
3.  **Run locally**:
    ```bash
    npm run dev
    ```

## 🗄️ Database Setup (Supabase)

This project requires a Supabase project. 
1.  Create a project at [supabase.com](https://supabase.com).
2.  Run the SQL migration scripts located in the chat history or set up the `projects` and `site_settings` tables manually.
3.  Update `js/supabase.js` with your Project URL and Anon Key.

## 📝 Credits

Original Design & Development by Web Digital.
© 2025 MF Projetando.
