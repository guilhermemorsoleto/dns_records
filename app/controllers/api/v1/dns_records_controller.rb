module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index
        # TODO: Implement this action
      end

      # POST /dns_records
      def create
        @dns_record = DnsRecord.new(dns_records_params)
        if @dns_record.save
          render json: { status: 200, id: @dns_record.id }
        else
          render json: { status: 422, error: @dns_record.errors.full_messages }
        end
      end

        private

      def dns_records_params
        params.require(:dns_records).permit(:ip, hostnames_attributes: [:hostname])
      end
    end
  end
end
