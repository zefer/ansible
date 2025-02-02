# A script to create the playlist files from a list of feeds.
class Playlists
  def initialize
    @feeds = feeds_from_data
  end

  def create
    @feeds.each do |head, body|
      head = head.chomp
      body = body.chomp

      filename = head.split(",").last + ".m3u"
      contents = ["#EXTM3U", head, body].join("\n")
      File.open(filename, 'w') { |f| f.write(contents) }
    end
  end

  private

  def feeds_from_data
    DATA.each_slice(2).to_a
  end
end

Playlists.new.create

# Feeds from https://gist.github.com/bpsib/67089b959e4fa898af69fea59ad74bc3
__END__
#EXTINF:-1,BBC Radio 1
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_one&bitrate=320000
#EXTINF:-1,BBC Radio 2
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_two&bitrate=320000
#EXTINF:-1,BBC Radio 3
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_three&bitrate=320000
#EXTINF:-1,BBC Radio 3 Unwind
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_three_unwind&bitrate=320000&uk=1
#EXTINF:-1,BBC Radio 4
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_fourfm&bitrate=320000
#EXTINF:-1,BBC Radio 4 Extra
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_four_extra&bitrate=320000
#EXTINF:-1,BBC Radio 5 Live
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_five_live&bitrate=320000
#EXTINF:-1,BBC 6 Music
http://lstn.lv/bbcradio.m3u8?station=bbc_6music&bitrate=320000
#EXTINF:-1,BBC World Service
http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_world_service.m3u8
#EXTINF:-1,BBC Radio Cumbria
http://lstn.lv/bbcradio.m3u8?station=bbc_radio_cumbria&bitrate=320000
