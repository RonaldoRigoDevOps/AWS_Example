#initialize node package<br>
npm init -y<br>

#install express<br>
npm install express<br>

#build a imagem<br>
docker build -t firstproject .<br>

#tag this image<br>
docker tag firstproject vbnascimento/firstproject<br>

#run this this image as container<br>
docker run -d -p 3000:3000 firstproject<br>

#check if the image is running<br>
docker ps -a<br>

#Create a repository on https://hub.docker.com/<br>

#Publish this image<br>
docker login<br>
docker push vbnascimento/firstproject<br>



#references<br>
https://flaviocopes.com/docker-node-container-example/<br>
https://jtemporal.com/subindo-imagens-docker-pro-dockerhub/<br>