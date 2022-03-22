require "socket"

Socket.tcp("localhost", 6600) do |sock|
    sock.gets
    sock << "currentsong\n"
    buf = ""
    artist = String.new
    title = String.new
    until buf=="OK\n" do
      buf = sock.gets
      if buf.match?("Title: (.+)\n") then
        title = buf.strip.delete_prefix "Title: "
      elsif buf.match? "Artist: (.+)\n" then
        artist = buf.strip.delete_prefix "Artist: "
      end
    end
    if title.empty? || artist.empty? then
      STDOUT << "no track\n"
    else
      STDOUT << artist << " - " << title << "\n"
    end
end
