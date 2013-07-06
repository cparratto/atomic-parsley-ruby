module AtomicParsleyRuby
  class Media
    #This will raise a AtomicParsley::Dependecy::Exception
    #or a AtomicParsley::File::Exception if things go wrong

    def initialize(file_name)
      @file =  ::Shellwords.escape(file_name)
      @params = {}
    end

    #  --artist       (string)     Set the artist tag\n"
    #  --title        (string)     Set the title tag\n"
    #  --album        (string)     Set the album tag\n"
    #  --genre        (string)     Genre tag (see --longhelp for more info)\n"
    #  --tracknum     (num)[/tot]  Track number (or track number/total tracks)\n"
    #  --disk         (num)[/tot]  Disk number (or disk number/total disks)\n"
    #  --comment      (string)     Set the comment tag\n"
    #  --year         (num|UTC)    Year tag (see --longhelp for \"Release Date\")\n"
    #  --lyrics       (string)     Set lyrics (not subject to 256 byte limit)\n"
    #  --composer     (string)     Set the composer tag\n"
    #  --copyright    (string)     Set the copyright tag\n"
    #  --grouping     (string)     Set the grouping tag\n"
    #  --artwork      (/path)      Set a piece of artwork (jpeg or png only)\n"
    #  --bpm          (number)     Set the tempo/bpm\n"
    #  --albumArtist  (string)     Set the album artist tag\n"
    #  --compilation  (boolean)    Set the compilation flag (true or false)\n"
    #  --hdvideo      (boolean)    Set the hdvideo flag (true or false)\n"
    #  --advisory     (string*)    Content advisory (*values: 'clean', 'explicit')\n"
    #  --stik         (string*)    Sets the iTunes \"stik\" atom (see --longhelp)\n"
    #  --description  (string)     Set the description tag\n"
    #  --longdesc     (string)     Set the long description tag\n"
    #  --TVNetwork    (string)     Set the TV Network name\n"
    #  --TVShowName   (string)     Set the TV Show name\n"
    #  --TVEpisode    (string)     Set the TV episode/production code\n"
    #  --TVSeasonNum  (number)     Set the TV Season number\n"
    #  --TVEpisodeNum (number)     Set the TV Episode number\n"
    #  --podcastFlag  (boolean)    Set the podcast flag (true or false)\n"
    #  --category     (string)     Sets the podcast category\n"
    #  --keyword      (string)     Sets the podcast keyword\n"
    #  --podcastURL   (URL)        Set the podcast feed URL\n"
    #  --podcastGUID  (URL)        Set the episode's URL tag\n"
    #  --purchaseDate (UTC)        Set time of purchase\n"
    #  --encodingTool (string)     Set the name of the encoder\n"
    #  --encodedBy    (string)     Set the name of the Person/company who encoded the file\n"
    #  --apID         (string)     Set the Account Name\n"
    #  --cnID         (number)     Set the iTunes Catalog ID (see --longhelp)\n"
    #  --xid          (string)     Set the vendor-supplied iTunes xID (see --longhelp)\n"
    #  --gapless      (boolean)    Set the gapless playback flag\n"
    #  --contentRating (string*)   Set tv/mpaa rating (see -rDNS-help)\n"


    [:artist, :title, :album,
     :genre, :tracknum, :disk,
     :comment, :year, :lyrics,
     :composer, :copyrights,
     :grouping, :artwork, :bpm, :description,
     :albumArtist, :compilation, :hdvideo,
     :advisory, :stick, :desctiption,
     :longdesc, :TVNetwork, :TVShowName,
     :TVEpisode, :TVSeasonNum, :TVEpisodeNum,
     :podcastFlag, :category, :keyword,
     :podcastURL, :podcastGUID, :purchaseDate,
     :encodingTool, :encodedBy, :apID,
     :cnID, :xid, :gappless,
     :contentRating].each do |method|
      define_method(method) do |arg|
        @params["--#{method}"] = ::Shellwords.escape(arg)
      end
    end

    def encode
      ::AtomicParsleyRuby::File.valid? @file

      if block_given?
        yield self
        self.process
      else
        #todo: I should raise an eception here.....
        #puts "no block"
      end
    end

    def process
      cmd_str = self.cmd
      #puts "Running #{cmd_str}"
      system(cmd_str)
    end

    def cmd
      ret = ::AtomicParsleyRuby::Dependency.path
      unless @params.empty?
        ret << " #{@file}"
        @params.each {|flag, arg| ret << " #{flag} #{arg}"}
      end
      ret
    end
  end
end