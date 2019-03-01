require 'fileutils'
# This module handle all the things related with paths
module FixtureHandler
  def self.clear_fixtures
    FileUtils.rm_rf(fixtures_dir)
  end

  def self.create_fixture_dir
    FileUtils.mkdir(fixtures_dir)
  end

  # create a file that the given index is the title and the
  def self.write_fixture(index, text)
    File.open(fixture_path(index), 'w') do |file|
      file.write(text)
    end
  end

  # evaluate if the file with the given index exists
  def self.fixture_exists?(index)
    File.exist?(fixture_path(index))
  end

  # read the file that his title is the same of the given number
  def self.read_fixture(index)
    File.read(fixture_path(index))
  end

  # Get the path of the file with the given number or index
  def self.fixture_path(index)
    "#{fixtures_dir}/#{index}.txt"
  end

  # Load the path of the project add the name of the folder that is goin
  # to be create in the method create_fixture_dir
  def self.fixtures_dir
    "#{__dir__}/fixtures"
  end
end
