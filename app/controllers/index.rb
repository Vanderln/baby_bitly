get '/' do
  @all_urls = Url.all
  erb :index
end

get '/:shorty' do
  full = Url.find_by_shorturl(params[:shorty])
  count = full.click_count + 1
  full.update_attributes(:click_count => count)
  redirect "#{full.url}"
end

post '/' do
  @all_urls = Url.all
  url = params[:user_url]
  view_url = Url.new(url: url, click_count: 1)
  if view_url.save
    redirect "/"
  else
    @errors = view_url.errors      
    erb :dummy  
  end 
end
