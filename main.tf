
resource "google_project" "calm-mariner-344718" {
  name       = "calm-mariner"
  project_id = "calm-mariner-344718"

}
resource "google_app_engine_application" "app" {
  project     = google_project.calm-mariner-344718
  location_id = "europe-west2"
}



