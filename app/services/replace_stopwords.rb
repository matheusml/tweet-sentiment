class TweetHandling 
  def self.handle(tweets)
    stop_words = %w{
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

    output = File.new("/stanford.preprocessed.arff","a")

    #arff header
    output.puts "@relation stanford"
    output.puts "\n"
    output.puts "@attribute sentiment_class {positive,negative}"
    output.puts "@attribute sentiment_text string"
    output.puts "\n"
    output.puts "@data"

    tweets do |tweet| 
      tweet.gsub!(/\W+/, " ")
      tweet_to_array = tweet.split(" ")

      new_tweet = "'"

      tweet_to_array.each { |token|
        if stop_words.include?(token)
          new_tweet += "STOPWORD "
        else
          new_tweet += "#{token} "
        end
      }

      new_tweet += "'"
      new_tweet = new_tweet.strip

      output.puts "?,#{new_tweet}"
    end

    output.close
  end
end