echo "Starting build and deployment to about_me_website"

flutter build web --base-href="/About_me_website/"

cd build/web/

git status
git add .
git status
git commit -m "Deploying to about_me_website"
git push

echo "Deployment and build process completed"

open 'https://karamiq.github.io/About_me_website/'