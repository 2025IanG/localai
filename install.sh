# This is just a simple installer for software that allows you to locally host AI
# Also comes with a T-ui to manage your AI
# It was developed for debian and ubuntu based operating systems but could also work on mac and other unix or unix-like OSs if you know what you're doing

# Install Ollama and curl
sudo apt install curl -y
curl -fsSL https://ollama.com/install.sh | sh

# Install python and Open WebUI
sudo apt install python3 -y
sudo apt install python3.12-venv -y
mkdir ~/.open-webui-venv
python3 -m venv ~/.open-webui-venv
~/.open-webui-venv/bin/pip install open-webui

# copy files into bin
sudo cp localai /bin
sudo cp localai.sh /bin

# make localai executable
sudo chmod a+x /bin/localai

echo "finished installation"
echo 'use the command "localai" to open the dashboard'