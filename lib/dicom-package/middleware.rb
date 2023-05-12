require 'tempfile'

module DicomPackage
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['CONTENT_TYPE'] =~ /^multipart\/related.*type\="application\/dicom"/ni
        request = Rack::Request.new(env)

        files = env['rack.request.form_hash'].keys.each_with_object({}).with_index(1) do |(param, memo), index|
          memo[param] = {
            type: 'application/dicom',
            filename: (filename = '%s.dcm' % index),
            tempfile: temporary_file(filename, env['rack.request.form_hash'][param])
          }

          request.delete_param(param)
        end

        request.update_param :files, files
      end

      @app.call(env)
    end

    private

    def temporary_file filename, binary
      file = Tempfile.new(filename)
      file.binmode
      file.write(binary)
      file.rewind
      file
    end
  end
end
