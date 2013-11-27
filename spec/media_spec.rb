require "spec_helper"

module AtomicParsleyRuby
  describe Media do
    [:artist, :title, :album,
     :genre, :tracknum, :disk,
     :comment, :year, :lyrics,
     :composer, :copyrights,
     :grouping, :artwork, :bpm, :description,
     :albumArtist, :compilation, :hdvideo,
     :advisory, :stik, :desctiption,
     :longdesc, :TVNetwork, :TVShowName,
     :TVEpisode, :TVSeasonNum, :TVEpisodeNum,
     :podcastFlag, :category, :keyword,
     :podcastURL, :podcastGUID, :purchaseDate,
     :encodingTool, :encodedBy, :apID,
     :cnID, :xid, :gappless,
     :contentRating].each do |flag|
      it "responds to #{flag}" do
        ::AtomicParsleyRuby::Dependency.stubs(:path).returns("AtomicParsley")
        v = Media.new("test.mp4")
        v.send(flag, "test-value")
        v.cmd.should eq "AtomicParsley test.mp4 --#{flag.to_s} test-value"
      end
    end

    it "sets multiple flags using the encode block" do
      ::AtomicParsleyRuby::Dependency.stubs(:path).returns("AtomicParsley")
      v = Media.new("test.mp4")
      stubs(:system).with("AtomicParsley test.mp4 --artist Some\\ Guy --year 2012 --genre Punk\\ Rock test.mp4 --artist Some\\ Guy --year 2012 --genre Punk\\ Rock").returns("Great Success")
      v.encode do |config|
        config.artist "Some Guy"
        config.year "2012"
        config.genre "Punk Rock"
      end
      v.cmd.should eq "AtomicParsley test.mp4 --artist Some\\ Guy --year 2012 --genre Punk\\ Rock test.mp4 --artist Some\\ Guy --year 2012 --genre Punk\\ Rock"
    end

  end
end