require 'spec_helper'
require 'rails_helper'

describe ApplicationHelper do

  describe 'AuditTrail#to_model' do
    context 'given valid and present versions' do
      let(:dummy_data) { create :category }
      it 'will return not empty audit_trail map' do
        audit_trail = ApplicationHelper::AuditTrail.to_model dummy_data.versions
        expect(audit_trail.present?).to eq true
        expect(audit_trail.size).to eq 1
      end
    end
    context 'given not present versions' do
      let(:dummy_data) { build :category }
      it 'will return nil data' do
        audit_trail = ApplicationHelper::AuditTrail.to_model dummy_data.versions
        expect(audit_trail.present?).to eq false
        expect(audit_trail).to eq nil
      end
    end
  end
end