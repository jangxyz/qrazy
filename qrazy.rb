require 'rubygems'
require 'sinatra'
require 'rqr'

get '/' do
  erb :index, {}, :@filename => '/data/blank.png'
end

post '/' do
  # params: {"qr_size"=>"8", "qr_cnt_type"=>"qr_cnt_type_url", "qr_cnt"=>"http://"}
  img_file = generate_qr_code(params[:qr_cnt], params[:qr_size])
  erb :index, {}, :@filename => img_file
end


def generate_qr_code(data, size)
  #
  filename = "/data/image.jpg"
  RQR::QRCode.create do |qr|
    qr.save(data, "public#{filename}")
  end
  filename
end

# vim: sts=2
