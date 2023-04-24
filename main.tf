resource "google_project" "my_project" {
  name = "My Project"
  project_id = "calm-mariner-344718"
}

resource "google_app_engine_application" "app" {
  project = google_project.my_project.project_id
  location_id = "europe -west2"
}
