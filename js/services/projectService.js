
import { supabase } from '../supabase.js';

export async function getProjects() {
    // If keys are dummy keys, return nothing to fallback to static HTML
    if (supabase.supabaseUrl.includes('YOUR_PROJECT_ID')) {
        return null;
    }

    const { data, error } = await supabase
        .from('projects')
        .select('*')
        .order('created_at', { ascending: false });

    if (error) {
        console.error('Error fetching projects:', error);
        throw error;
    }
    return data;
}

export async function createProject(project) {
    const { data, error } = await supabase
        .from('projects')
        .insert([project])
        .select();

    if (error) throw error;
    return data;
}

export async function deleteProject(id) {
    const { error } = await supabase
        .from('projects')
        .delete()
        .eq('id', id);

    if (error) throw error;
}

// Storage handling
export async function uploadImage(file) {
    const fileName = `${Date.now()}-${file.name}`;
    const { data, error } = await supabase.storage
        .from('project-images')
        .upload(fileName, file);

    if (error) throw error;

    const { data: publicData } = supabase.storage
        .from('project-images')
        .getPublicUrl(fileName);

    return publicData.publicUrl;
}
