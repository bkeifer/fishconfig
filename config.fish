if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U tide_os_icon 
    
    alias ipcalc="ipcalc -n"
    alias python="python3"
    alias digs="dig +short"
    alias whoisa="whois -h whois.arin.net"

    function xaws
        set -e AWS_ACCESS_KEY_ID
        set -e AWS_SECRET_ACCESS_KEY
        set -e AWS_SESSION_TOKEN
        reset
    end

end
