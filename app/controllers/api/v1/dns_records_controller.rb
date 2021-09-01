module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index
        # Where should I use page?
        page = params[:page]
        return render json: { status: 422, error: "page is required" } unless page.present?
        hostnames = []
        total_records = 0
        included = params[:included].try(:split, ',')
        excluded = params[:excluded].try(:split, ',')

        # Needs refactory
        @dns_records = DnsRecord.all
        @dns_records.each do |dns_record|
          records = dns_record.hostnames.included(included).excluded(excluded)
          if records.present?
            # Needs to add count number of hostnames
            hostnames.push(records)
            total_records = total_records + 1
          end
        end

        # Without each loop with the proper query we can change this return
        render json: { records: @dns_records, related_hostnames: hostnames, total_records: total_records }
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
