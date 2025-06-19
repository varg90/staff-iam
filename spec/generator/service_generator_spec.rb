# frozen_string_literal: true

require "generators/service/service_generator"

RSpec.describe ServiceGenerator do
  let(:service_name) { "Thang::Thing" }
  let(:service_pathname) { root / "app/services/thang/thing.rb" }
  let(:contract_pathname) { root / "app/services/thang/contracts/thing_contract.rb" }

  it "generates service" do
    expect { run_generator([service_name]) }.to(
      change(service_pathname, :exist?).to(true)
    )
    expect(service_pathname).to be_file
  end

  it "generates service's contract" do
    expect { run_generator([service_name]) }.to(
      change(contract_pathname, :exist?).to(true)
    )
    expect(contract_pathname).to be_file
  end
end
