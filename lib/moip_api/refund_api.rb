module Moip
  module V2
    class RefundApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path(order_id)
        "/orders/#{order_id}/refunds"
      end

      def full(order_id)
        @response = client.post(base_path(order_id), {})
      end

      def partial(order_id, value)
        @response = client.post(base_path(order_id), {amount: value})
      end

      def billet_full(order_id, bank, agency, agency_check, account, account_check, fullname, cpf)
        @response = client.post(base_path(order_id), informe(bank, agency, agency_check, account, account_check, fullname, cpf))
      end

      def billet_partial(order_id, value, bank, agency, agency_check, account, account_check, fullname, cpf)
        @response = client.post(base_path(order_id), informe_patial(value, bank, agency, agency_check, account, account_check, fullname, cpf))
      end

      private
        def informe_patial(value, bank, agency, agency_check, account, account_check, fullname, cpf)
          {
            amount: value,
            refundingInstrument: {
              method: "BANK_ACCOUNT",
              bankAccount: {
                type: "CHECKING",
                bankNumber: bank,
                agencyNumber: agency,
                agencyCheckNumber: agency_check,
                accountNumber: account,
                accountCheckNumber: account_check,
                holder: {
                  fullname: fullname,
                  taxDocument: {
                    type: "CPF",
                    number: cpf
                  }
                }
              }
            }
          }
        end

        def informe(bank, agency, agency_check, account, account_check, fullname, cpf)
          {
            refundingInstrument: {
              method: "BANK_ACCOUNT",
              bankAccount: {
                type: "CHECKING",
                bankNumber: bank,
                agencyNumber: agency,
                agencyCheckNumber: agency_check,
                accountNumber: account,
                accountCheckNumber: account_check,
                holder: {
                  fullname: fullname,
                  taxDocument: {
                    type: "CPF",
                    number: cpf
                  }
                }
              }
            }
          }
        end
    end
  end
end
