if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# Docker stuffs
if type -q docker-compose
    alias dcu "docker-compose up -d"
    alias dcd "docker-compose down"
end


starship init fish | source
