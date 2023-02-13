module Api
	module V1
		class KeyValuesController < ApplicationController

			def index
				result = ActiveRecord::Base.connection.execute("SELECT * from stores where ttl <> -1")
				render json: result
			end

			def create
				begin
					record = ActiveRecord::Base.connection.execute("INSERT INTO stores (key, values, ttl) VALUES ('#{permitted_params[:key]}', '#{permitted_params[:values]}', extract(epoch from ((now() at time zone 'UTC') - interval '2 hour'))) ON CONFLICT(key) DO UPDATE SET values = '#{permitted_params[:values]}';")
					render json: { data: record.first, message: 'record created successfully'}
				rescue StandardError => e
					render json: { error_messages: "Record not created, error: #{e.message}"}, status: 500
				end
			end

			def destroy
				begin
					# result = ActiveRecord::Base.connection.execute("SELECT * from stores WHERE key = '#{params[:key]}' AND ttl > extract(epoch from ((now() at time zone 'UTC')))")
					result = ActiveRecord::Base.connection.execute("UPDATE stores SET ttl = -1 WHERE key = '#{params[:key]}'")
					render json: { message: 'record removed successfully'}
				rescue StandardError => e
					render json: { error_messages: "Record not deleted, error: #{e.message}"}, status: 500
				end
			end


			def permitted_params
				params.permit(:key, :values)
			end
		end
	end
end