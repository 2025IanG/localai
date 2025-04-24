start_ollama() {
    ollama serve
    dialog --msgbox "An error means that ollama is already running. You can ignore it." 0 0
}

download_ollama() {
    dialog --msgbox "Go to https://ollama.com/search in your broswer, and pick the model you want to download." 0 0
    MODEL=$(dialog --inputbox "Please type in the model you want to download:" 0 0 3>&1 1>&2 2>&3 3>&-)
    ollama pull $MODEL
}

open_webui() {
    dialog --infobox "Opening the WebUI for the AI in Firefox. This will take approximately 10 seconds." 0 0
    gnome-terminal -- ~/.open-webui-venv/bin/open-webui serve
    sleep 10
    firefox 127.0.0.1:8080
}

while true
do
    CHOICE=$(dialog --menu "Select option:" 0 0 0 \
        1 "Start Ollama" \
        2 "Download an Ollama model" \
        3 "Open WebUI" \
        4 "Exit" \
        3>&1 1>&2 2>&3 3>&-)
    case $CHOICE in 
        1) start_ollama ;;
        2) download_ollama ;;
        3) open_webui ;;
        *) clear; exit;;
    esac
done