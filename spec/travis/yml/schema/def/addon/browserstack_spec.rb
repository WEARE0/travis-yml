describe Travis::Yml::Schema::Def::Addon::Browserstack, 'structure' do
  describe 'definitions' do
    subject { Travis::Yml.schema[:definitions][:addon][:browserstack] }

    # it { puts JSON.pretty_generate(subject) }

    it do
      should eq(
        '$id': :addon_browserstack,
        title: 'Addon Browserstack',
        normal: true,
        anyOf: [
          {
            type: :object,
            properties: {
              username: {
                '$ref': '#/definitions/type/secure'
              },
              access_key: {
                '$ref': '#/definitions/type/secure'
              },
              app_path: {
                type: :string
              },
              forcelocal: {
                type: :boolean
              },
              only: {
                type: :string
              },
              proxyHost: {
                type: :string
              },
              proxyPort: {
                type: :string
              },
              proxyUser: {
                type: :string
              },
              proxyPass: {
                '$ref': '#/definitions/type/secure'
              }
            },
            additionalProperties: false,
            changes: [
              {
                change: :enable
              }
            ],
            normal: true
          },
          {
            type: :boolean
          }
        ]
      )
    end
  end

  describe 'schema' do
    subject { described_class.new.schema }

    it do
      should eq(
        '$ref': '#/definitions/addon/browserstack'
      )
    end
  end
end
