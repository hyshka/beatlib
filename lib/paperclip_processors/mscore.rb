module Paperclip
  # Handles ...
  class Mscore < Processor

    attr_accessor :format

    # Creates a Thumbnail object set to work on the +file+ given. It
    # will attempt to transform the image into one defined by +target_geometry+
    # which is a "WxH"-style string. +format+ will be inferred from the +file+
    # unless specified. Thumbnail creation will raise no errors unless
    # +whiny+ is true (which it is, by default. If +convert_options+ is
    # set, the options will be appended to the convert command upon image conversion
    #
    # Options include:
    #
    #   +format+ - the desired filename extension
    def initialize(file, options = {}, attachment = nil)
      super

      @format              = options[:format]

      @current_format      = File.extname(@file.path)
      @basename            = File.basename(@file.path, @current_format)
    end

    # Performs the conversion of the +file+ into a thumbnail. Returns the Tempfile
    # that contains the new image.
    def make
      src = @file
      dst = Tempfile.new([@basename, @format ? ".#{@format}" : ''])
      dst.binmode

      begin
        parameters = []
        parameters << File.expand_path(src.path)
        parameters << "-o"
        parameters << File.expand_path(dst.path)
        
        parameters = parameters.flatten.compact.join(" ").strip.squeeze(" ")

        success = mscore(parameters)
      rescue Cocaine::ExitStatusError => e
        raise Paperclip::Error, "There was an error processing the mp3 for #{@basename}"
      rescue Cocaine::CommandNotFoundError => e
        raise Paperclip::Errors::CommandNotFoundError.new("Could not run the `mscore` command. Please install MuseScore.")
      end

      dst
    end
    
    # The convert method runs the convert binary with the provided arguments.
    # See Paperclip.run for the available options.
    def mscore(arguments = "", local_options = {})
      Paperclip.run('mscore', arguments, local_options)
    end

    protected

  end
end
