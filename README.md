# AtomicParsleyRuby

A wrapper api for the atomicparsley cli. This is good for scripting out bulk media meta encodeing. It has been tested on mp3, mp4, and m4v

## Installation

    OSX
        brew install AtomicParsley
    Ubuntu
        sudo apt-get install AtomicParsley
    Windows
        install Linux

Add this line to your application's Gemfile:

    gem 'atomic-parsley-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install atomic-parsley-ruby

## Usage
    # You can set any of the following attributes on the media class.
    #  artist       (string)     Set the artist tag
    #  title        (string)     Set the title tag
    #  album        (string)     Set the album tag
    #  genre        (string)     Genre tag (see longhelp for more info)
    #  tracknum     (num)[/tot]  Track number (or track number/total tracks)
    #  disk         (num)[/tot]  Disk number (or disk number/total disks)
    #  comment      (string)     Set the comment tag
    #  year         (num|UTC)    Year tag (see longhelp for \"Release Date\")
    #  lyrics       (string)     Set lyrics (not subject to 256 byte limit)
    #  composer     (string)     Set the composer tag
    #  copyright    (string)     Set the copyright tag
    #  grouping     (string)     Set the grouping tag
    #  artwork      (/path)      Set a piece of artwork (jpeg or png only)
    #  bpm          (number)     Set the tempo/bpm
    #  albumArtist  (string)     Set the album artist tag
    #  compilation  (boolean)    Set the compilation flag (true or false)
    #  hdvideo      (boolean)    Set the hdvideo flag (true or false)
    #  advisory     (string*)    Content advisory (*values: 'clean', 'explicit')
    #  stik         (string*)    Sets the iTunes \"stik\" atom (see longhelp)
    #  description  (string)     Set the description tag
    #  longdesc     (string)     Set the long description tag
    #  TVNetwork    (string)     Set the TV Network name
    #  TVShowName   (string)     Set the TV Show name
    #  TVEpisode    (string)     Set the TV episode/production code
    #  TVSeasonNum  (number)     Set the TV Season number
    #  TVEpisodeNum (number)     Set the TV Episode number
    #  podcastFlag  (boolean)    Set the podcast flag (true or false)
    #  category     (string)     Sets the podcast category
    #  keyword      (string)     Sets the podcast keyword
    #  podcastURL   (URL)        Set the podcast feed URL
    #  podcastGUID  (URL)        Set the episode's URL tag
    #  purchaseDate (UTC)        Set time of purchase
    #  encodingTool (string)     Set the name of the encoder
    #  encodedBy    (string)     Set the name of the Person/company who encoded the file
    #  apID         (string)     Set the Account Name
    #  cnID         (number)     Set the iTunes Catalog ID (see longhelp)
    #  xid          (string)     Set the vendor-supplied iTunes xID (see --longhelp)
    #  gapless      (boolean)    Set the gapless playback flag
    #  contentRating (string)   Set tv/mpaa rating (see -rDNS-help)

    v = AtomicParsleyRuby::Media.new("test.mp4")

    v.artist "Some Guy"
    v.year "2012"
    v.genre "Punk Rock"
    v.artwork "cover.png"
    v.process

    # you can also use the block format below.

    v.encode do |config|
        config.artist "Some Guy"
        config.year "2012"
        config.genre "Punk Rock"
        config.artwork "cover.png"
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
