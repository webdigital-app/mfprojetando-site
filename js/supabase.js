
import { createClient } from '@supabase/supabase-js'

// Placeholder Keys - REPLACE THESE LATER
const supabaseUrl = 'https://tdpygfryqgwyxvexhlaq.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRkcHlnZnJ5cWd3eXh2ZXhobGFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxNjM2ODQsImV4cCI6MjA4MzczOTY4NH0.wJCDwgsnnKR66jlmt-e9-Xle0phOlPNd_-iiepWfFrw'

export const supabase = createClient(supabaseUrl, supabaseKey)
