RSpec.describe 'Errors' do
  it 'defines all necessarry error classes' do
    expect { Nuncium::ConfigNotSet }.not_to raise_error
    expect { Nuncium::HtmlResponseReceived }.not_to raise_error
  end
end
