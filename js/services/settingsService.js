
import { supabase } from '../supabase.js';

export async function getSettings() {
    const { data, error } = await supabase
        .from('site_settings')
        .select('*')
        .order('category'); // Group by category nicely

    if (error) {
        console.error('Error fetching settings:', error);
        return [];
    }
    return data;
}

export async function updateSetting(key, newValue) {
    const { data, error } = await supabase
        .from('site_settings')
        .update({ value: newValue })
        .eq('key', key)
        .select();

    if (error) throw error;
    return data;
}

export async function getPageContent() {
    const { data, error } = await supabase
        .from('page_content')
        .select('*')
        .order('page, key');

    if (error) {
        console.error('Error fetching page content:', error);
        return [];
    }
    return data;
}

export async function updatePageContent(key, newValue) {
    const { data, error } = await supabase
        .from('page_content')
        .update({ value: newValue })
        .eq('key', key)
        .select();

    if (error) throw error;
    return data;
}
