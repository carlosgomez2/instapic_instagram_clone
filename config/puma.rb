threads 0,4 # threads from enviroment

workers 3 # workers for user petitions
preload_app! # preload app folder when server is started

# when worker start to supply demand of user, worker automatically connect to the database
on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
