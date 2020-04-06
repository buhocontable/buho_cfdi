module BuhoCfdi
  require 'openssl'
 
  class Certificate
     
    attr_reader :certificate_number, :data
 
    def initialize (file)
      if file.is_a? String
        file = File.read(file)
      end
      certificate = OpenSSL::X509::Certificate.new(file)
      @certificate_number = '';
      certificate.serial.to_s(16).scan(/.{2}/).each { |v| @certificate_number += v[1]; }
      @data = certificate.to_s.gsub(/^-.+/, '').gsub(/\n/, '')
      
    end

    def certificate(invoice)
      invoice.certificate_number = @certificate_number
      invoice.certificate = @data
    end

  end
end