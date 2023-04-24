Hosting a static website on Google App Engine, link: https://cloud.google.com/appengine/docs/legacy/standard/python/getting-started/hosting-a-static-website#whats_next

Basic structure for the project

app.yaml: Configure the settings of your App Engine application.

www/: Directory to store all of your static files, such as HTML, CSS, images, and JavaScript.

 css/: Directory to store stylesheets.

 style.css: Basic stylesheet that formats the look and feel of your site.

 images/: Optional directory to store images.

 index.html: An HTML file that displays content for your website.
 
 js/: Optional directory to store JavaScript files.

 Other asset directories.

CREATING APP.YAML file

runtime: python27
api_version: 1
threadsafe: true

handlers:
- url: /
  static_files: www/index.html
  upload: www/index.html

- url: /(.*)
  static_files: www/\1
  upload: www/(.*)



creating MYINDEX.HTML file

<html>
  <head>
    <title>Hello, world!</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
  </head>
  <body>
    <h1>Hello, world!</h1>
    <p>
      This is a simple static HTML file that will be served from Google App
      Engine.
    </p>
  </body>
</html>


I have used myindex.html file and picture created for my Kodilla bootcamp project


Picture- downloaded in the storage bucket(I have copied the url address to the MYINDEX.HTML file)

Deploying your application to App Engine

--gcloud app deploy

Viewing your application

--gcloud app browse

website link: https://calm-mariner-344718.nw.r.appspot.com/

creating files :
-backend.tf
-main.tf
-provider.tf

generate a key from the service account and place the credentials to secret key of the repository
 TF_GOOGLE_CREDENTIALS

Create a file in your repository .github/workflows/terraform.yml

name: 'Terraform CI'

on:
  push:
    branches:
    - main

jobs:
  terraform:
    name: 'Terraform'
    runs-on: ubuntu-latest

    # Use the Bash shell regardless whether the GitHub Actions runner is ubuntu-latest, macos-latest, or windows-latest
    defaults:
      run:
        shell: bash

    steps:
    # Checkout the repository to the GitHub Actions runner
    - name: Checkout
      uses: actions/checkout@v2

    # Install the latest version of Terraform CLI
    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v1


    # Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.
    - name: Terraform Init
      run: terraform init
      env:
        GOOGLE_CREDENTIALS: ${{ secrets.TF_GOOGLE_CREDENTIALS }}

    # Run terraform fmt to check whether the formatting of the files is correct
    - name: Terraform Format
      run: terraform fmt -check

    # Run terraform plan
    - name: Terraform Plan
      run: terraform plan
      env:
        GOOGLE_CREDENTIALS: ${{ secrets.TF_GOOGLE_CREDENTIALS }}

    # Run terraform apply
    - name: Terraform Apply
      run: terraform apply -auto-approve
      env:
        GOOGLE_CREDENTIALS: ${{ secrets.TF_GOOGLE_CREDENTIALS }}


Now commit all files to the repo and push the change to the remote repository. Go to github.com and check the Actions tab in your repository. You should see the workflows in there (in other tools e.g gitlab we would call them pipeline runs).



