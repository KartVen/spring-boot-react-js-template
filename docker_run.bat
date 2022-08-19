docker build . -t spring_boot_react_js
docker stop spring_boot_react_js || true
docker rm spring_boot_react_js || true
docker run -d -p 8080:8080 --name=spring_boot_react_js --restart unless-stopped -e SPRING_PROFILES_ACTIVE=prod spring_boot_react_js