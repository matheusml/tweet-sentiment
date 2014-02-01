class TweetHandling 
  def self.generate_file(tweets)
    output = prepare_file

    tweets.each do |tweet| 
      text = tweet.text.gsub(',', ' ').gsub('"', ' ').gsub("(", " ").gsub(")", " ").gsub("[", " ").gsub("]", " ")
      tweet_to_array = text.split(" ")

      new_tweet = ""

      tweet_to_array.each do |token|
        if replace_stopwords?(token) 
          new_tweet += "STOPWORD "
        elsif replace_username?(token)
          new_tweet += "USERNAME "
        elsif replace_hashtag?(token)
          new_tweet += "HASHTAG "
        elsif replace_url?(token)
          new_tweet += "URL "
        else              
          new_tweet += "#{token} "
        end
      end

      new_tweet += ""
      new_tweet = new_tweet.strip

      output.puts "#{new_tweet}"
    end

    output.close
  end

  def self.replace_url?(token)
    token[0,3] == 'www' || token[0,4] == 'http'
  end

  def self.replace_hashtag?(token)
    token[0,1] == '#'
  end

  def self.replace_username?(token)
    token[0,1] == '@'
  end

  def self.replace_stopwords?(token)
    stop_words.include?(token)
  end

  def self.prepare_file
    path_to_file = "tweets.txt"
    path_to_output_file = "positivenegative.txt"
    File.delete(path_to_file) if File.exist?(path_to_file)
    File.delete(path_to_output_file) if File.exist?(path_to_file)
    output = File.new(path_to_file,"a")
    output
  end

  def self.stop_words
    %w{
      a
      about
      above
      after
      again
      against
      ain't
      aint
      all
      am
      an
      and
      any
      are
      aren't
      arent
      as
      at
      b
      be
      because
      been
      before
      being
      below
      between
      both
      but
      by
      c
      can
      can't
      cannot
      cant
      could
      couldn't
      couldnt
      d
      did
      didn't
      didnt
      do
      does
      doesn't
      doesnt
      doing
      don't
      dont
      down
      during
      e
      each
      f
      few
      for
      from
      further
      g
      h
      had
      hadn't
      hadnt
      has
      hasn't
      hasnt
      have
      haven't
      havent
      having
      he
      he'd 
      he'll
      he's 
      hed
      her
      here
      here's 
      heres
      hers
      herself
      hes
      him
      himself
      his
      how
      how's
      i
      i'd
      i'll
      i'm  
      i've  
      id
      if
      ill
      im
      in
      into
      is
      isn't
      isnt
      it
      it's
      its
      itself
      ive
      j
      just
      jus
      k
      l
      let's
      lets
      m
      me
      more
      most
      mustn't
      mustnt
      my
      myself
      n    
      no
      non
      none
      nor
      not
      now
      o
      of
      off
      on
      once
      only
      or
      other
      ought
      our
      ours 
      ourselves
      out
      over
      own
      p
      q
      r
      s
      same
      shan't
      shant
      she
      she'd 
      she'll
      she's
      shed
      shell
      shes
      should
      should've 
      shouldn't
      shouldnt
      shouldve
      so
      some
      such
      t
      than
      that
      that's
      thats
      the
      their
      theirs
      them
      themselves
      then
      there
      there's 
      theres
      these
      they
      they'd  
      they'll 
      they're 
      they've  
      theyd
      theyll
      theyre
      theyve
      this
      those
      through
      to
      too
      u
      under
      until
      up
      v
      very
      w
      was
      wasn't
      wasnt
      we
      we'd
      we'll 
      we're 
      we've 
      wed
      well
      were
      weren't
      werent
      weve
      what
      what's 
      whats
      when
      when's 
      whens
      where
      where's 
      wheres
      which
      which's
      whichs
      while
      who
      who's
      whom
      whos
      why
      why's 
      whys
      will
      with
      won't
      wont
      would
      wouldn't
      wouldnt
      y
      ya
      you
      you'd
      you'll 
      you're
      you've
      youd
      youll
      your
      youre
      yours
      yourself
      yourselves
      youve
      x
      z
    }
  end
end