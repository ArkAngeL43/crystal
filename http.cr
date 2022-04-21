#
#
#
#sudo apt-get install gcc pkg-config git tzdata \
#                           libpcre3-dev libevent-dev libyaml-dev \
#                           libgmp-dev libssl-dev libxml2-dev
#

require "http/server"

def print_res(addr, port)
    puts %w("#{addr}", "#{port}")
end


def server(addr, port)
    s = HTTP::Server.new do |ctx|
        ctx.response.content_type = "text/plain"
        ctx.response.print "Listening on - #{addr}"
    end
    address = s.bind_tcp 8080
    puts "[+] Started server on http://#{addr}:#{port}"
    s.listen
end

def main(addr, port)
    print_res("#{addr}", "#{port}")
    server("#{addr}", "#{port}")
end 

main("0.0.0.0", "8080")
