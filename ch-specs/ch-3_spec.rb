require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 3' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    ['QC 5R 3T AP JC','carta mas alta'],
    ['3C 5R JP 3T 7T','par'],
    ['JC 4T 2T JR 2C','doble par'],
    ['3C 3T 3R 2P 4C','pierna'],
    ['2R 3P 4R 5T 6C','escalera'],
    ['2C 4C 6C 8C DC','color'],
    ['4C 4T 4P JR JT','full'],
    ['7C 3P 7P 7R 7T','poker'],
    ['DP 9P 8P 7P 6P','escalera de color'],
    ['AC KC QC JC DC','escalera real']
  ]

  RANDOM_CASES = [
    ['JC 2T 6R 3C 9C', 'carta mas alta'],
    ['9C QP QP 6P 9P', 'doble par'],
    ['8P 4P 7R 8T DC', 'par'],
    ['KP KR 2C 9C 2C', 'doble par'],
    ['6T 9C DT 2C 3C', 'carta mas alta'],
    ['7C 3P QT DC 2R', 'carta mas alta'],
    ['2R 9R AT 3C 5R', 'carta mas alta'],
    ['4C AT KR AR 8C', 'par'],
    ['6T 7P 6R 3T 6T', 'pierna'],
    ['AP JC 5T 6R 3R', 'carta mas alta'],
    ['JT 6P AP 3T JR', 'par'],
    ['7P 5P JC DT QC', 'carta mas alta'],
    ['4C JT 5P 3P JT', 'par'],
    ['6C DR 7C QR QP', 'par'],
    ['KR 9P AP 3R 8P', 'carta mas alta'],
    ['3R JP JR 7C AP', 'par'],
    ['QT 3C JR 2T 3R', 'par'],
    ['5P 7P 7R 8T 7C', 'pierna'],
    ['9C 7C 3T 7P 3P', 'doble par'],
    ['5C 3C JR 7C JC', 'par'],
    ['AR AP QC JP 8T', 'par'],
    ['5P 5P 3R 2C DR', 'par'],
    ['6T JC 7P 4P 8R', 'carta mas alta'],
    ['5C 2P 8R 7P 3R', 'carta mas alta'],
    ['6T 5T JT DP 5C', 'par'],
    ['KR 4C 3T KR 6P', 'par'],
    ['AT 5R 8T 7T 3C', 'carta mas alta'],
    ['3T 2R AR 2R 6T', 'par'],
    ['7T KC 9R 6C 8C', 'carta mas alta'],
    ['9R DC 9T 9T 5P', 'pierna'],
    ['JP QR 6T 5P 2R', 'carta mas alta'],
    ['4T 5C KR AT KT', 'par'],
    ['5P 3R 7P AT DC', 'carta mas alta'],
    ['5T KR 9C DP 4P', 'carta mas alta'],
    ['8T 5P 8R 3R 2C', 'par'],
    ['KP QC 7C 3C KT', 'par'],
    ['8C KC 3T 3T 8R', 'doble par'],
    ['9R 4R 3C JP 4C', 'par'],
    ['3R 5C QP 2R AP', 'carta mas alta'],
    ['DT 9T QC QR 7C', 'par'],
    ['QT JR JP 2P JP', 'pierna'],
    ['3P 8C 6T 5P KR', 'carta mas alta'],
    ['QP 9C 6T 3R 6T', 'par'],
    ['6C JC QP 5P 4R', 'carta mas alta'],
    ['QR QC 8C 4C QP', 'pierna'],
    ['3R QT 2C 4P 2C', 'par'],
    ['7T 2P 2P 3P QP', 'par'],
    ['9T 9P QR QT 3C', 'doble par'],
    ['9P 3P 3C 2T 9T', 'doble par'],
    ['8C DT 4T JP AC', 'carta mas alta'],
    ['KP KC AC 6C 7T', 'par'],
    ['QC QP 6T 8C 6R', 'doble par'],
    ['QC 5P 5T 9R 5P', 'pierna'],
    ['DP KT AP 3P 2R', 'carta mas alta'],
    ['QC QT 3P KT JT', 'par'],
    ['AC QC QC AC JP', 'doble par'],
    ['7R QP 6R JT 9R', 'carta mas alta'],
    ['6R KP 2C 8T 9P', 'carta mas alta'],
    ['JP DP 6P QC 4P', 'carta mas alta'],
    ['8P AP 8R QP JP', 'par'],
    ['JT 3R 9P 9P QR', 'par'],
    ['8P KC AP JT 2T', 'carta mas alta'],
    ['2C 2C KC KR 7C', 'doble par'],
    ['3P 7P 4C 9R 4T', 'par'],
    ['8T QP 4C 3P AC', 'carta mas alta'],
    ['DC 5C KR 6C 8R', 'carta mas alta'],
    ['2R 6R 6C 6P 7C', 'pierna'],
    ['6P 3C 4R 5T JP', 'carta mas alta'],
    ['4T 3T 6P 8P 5R', 'carta mas alta'],
    ['5P 3T 2C AC KC', 'carta mas alta'],
    ['KP 6R 6C DT 5P', 'par'],
    ['8R JP QR QR KR', 'par'],
    ['9C 3P 8P QP 8C', 'par'],
    ['AR 3C 9P JC JC', 'par'],
    ['AP 2R KT 8C 7C', 'carta mas alta'],
    ['9R 7C 4P 9R 3C', 'par'],
    ['DC AP KC 7P AT', 'par'],
    ['JT 3C QR KP 3C', 'par'],
    ['2R 7T 8P 3R 6R', 'carta mas alta'],
    ['QP 8T 8C 3T 8C', 'pierna'],
    ['6P 6C 6C 5C AC', 'pierna'],
    ['AP DC 5P 7R 4C', 'carta mas alta'],
    ['9R 6C AP 8P 7C', 'escalera'],
    ['DR 7R 6P 9P 9P', 'par'],
    ['AC 2R 4R 8R 3R', 'carta mas alta'],
    ['9T AR KP 5T 5C', 'par'],
    ['8C 9C 2T 8T JT', 'par'],
    ['8P AP 7T 4C DC', 'carta mas alta'],
    ['JC 4T QR 8C 7C', 'carta mas alta'],
    ['QR JP AR 5R 9T', 'carta mas alta'],
    ['KT JR QT 8C JT', 'par'],
    ['2C DT DT AR DC', 'pierna'],
    ['3R AT 9P 4P 9R', 'par'],
    ['6R 4T 3T 2P 8T', 'carta mas alta'],
    ['5P 6R JR KT 8P', 'carta mas alta'],
    ['5C 7R 4P 3C AT', 'carta mas alta'],
    ['7C 6R AT 7R 2P', 'par'],
    ['9R AR 6T 5P 3R', 'carta mas alta'],
    ['7T 9T 5P KP 8T', 'carta mas alta'],
    ['DC 9R 8C QR 3R', 'carta mas alta'],
    ['QT 9C 5R 9R 6T', 'par'],
    ['QT 5T JC QC 9T', 'par'],
    ['7C 7C 7T 6C KR', 'pierna'],
    ['AR 3T 6P 6T QC', 'par'],
    ['KT 2P DT 8P 5C', 'carta mas alta'],
    ['3R 4R 6T JR 9T', 'carta mas alta'],
    ['5R DT 4T 6P 8P', 'carta mas alta'],
    ['6C 9T KC DP AP', 'carta mas alta'],
    ['2T KR QP 3T DT', 'carta mas alta'],
    ['3P JP 3T 8R 9C', 'par'],
    ['9R 7P AC KR 4R', 'carta mas alta'],
    ['JP DP KT KC DT', 'doble par'],
    ['AP 5T 9C QP 4T', 'carta mas alta'],
    ['9C QP KT KP JT', 'par'],
    ['4T DR QP 5C 6T', 'carta mas alta'],
    ['5P QT 5T 2P 8T', 'par'],
    ['DP JP DP 7C 6P', 'par'],
    ['KT 7T 2C 9C 5T', 'carta mas alta'],
    ['QT DC 2P 2R DC', 'doble par'],
    ['7C KP 7P JP 5C', 'par'],
    ['7P 8P QC QT 2T', 'par'],
    ['6P 3P KP 3R 9P', 'par'],
    ['KC 2C 8T 8R 7P', 'par'],
    ['AP JR KT 6R JR', 'par'],
    ['9R 8T 5T 4P 4P', 'par'],
    ['AP KR AR 3C 8T', 'par'],
    ['DT QR KT DC QT', 'doble par'],
    ['5P QT 7C DC JT', 'carta mas alta'],
    ['6P 2P 5T DT 3C', 'carta mas alta'],
    ['JT 6R 2R KR KP', 'par'],
    ['2R DT 3C AR 9R', 'carta mas alta'],
    ['2C AR JT DC AT', 'par'],
    ['JP DT 3R AR 5R', 'carta mas alta'],
    ['3T 9P 2P 8R 8R', 'par'],
    ['5C 5R 7P QT 6P', 'par'],
    ['5T 4C 9T KC 7T', 'carta mas alta'],
    ['8R KP 5R KP DP', 'par'],
    ['AR 4P 8C DP 4P', 'par'],
    ['QC JT 6R DT 8C', 'carta mas alta'],
    ['QR 9P 2P KC DP', 'carta mas alta'],
    ['KR 9T QT 7T 3C', 'carta mas alta'],
    ['QC JR 7R 9T 6C', 'carta mas alta'],
    ['4T 3T 5T 9P 3P', 'par'],
    ['AT 4R 2P KR 4C', 'par'],
    ['AC 6C JP 4R 6P', 'par'],
    ['KR KT 6P 6T 8P', 'doble par'],
    ['7C JT 4C 8R 9C', 'carta mas alta'],
    ['8T 9R KC 2R QT', 'carta mas alta'],
    ['2P JC 4P JC 2R', 'doble par'],
    ['2P 6T 9P AR QC', 'carta mas alta'],
    ['AT 2R AT 3T 6C', 'par'],
    ['QT 8C DR 8T 8P', 'pierna'],
    ['AC AC DR 3C JP', 'par'],
    ['8R JC AT DR QR', 'carta mas alta'],
    ['KR DR KT 5P DP', 'doble par'],
    ['4P 3T 9R 5P 3T', 'par'],
    ['6T 6T AR 2P KP', 'par'],
    ['7C KR 7C 4T JT', 'par'],
    ['2P 4C KT AR AC', 'par'],
    ['JP 4C 4P DC 8R', 'par'],
    ['8P 3C 3T KR 4P', 'par'],
    ['2P 9P QC 5C DC', 'carta mas alta'],
    ['8T AC 9R QT JC', 'carta mas alta'],
    ['4R KT 9R 9P 2T', 'par'],
    ['5T AR 2C JP QT', 'carta mas alta'],
    ['6C 2T 7R 9T QC', 'carta mas alta'],
    ['KR KR AT KR DT', 'pierna'],
    ['KC 7P 6P AT JP', 'carta mas alta'],
    ['3C 4C 5P 8R 7C', 'carta mas alta'],
    ['5R DC 8C QT QR', 'par'],
    ['DP QT JC 5T 7R', 'carta mas alta'],
    ['JP 7R 3T 9P 9C', 'par'],
    ['2C 5P 6P AC 7P', 'carta mas alta'],
    ['QC 5P 6T 8P KP', 'carta mas alta'],
    ['DC 4P 5C 2C 4T', 'par'],
    ['JC 5T 7R KP 8C', 'carta mas alta'],
    ['8T QC 6P 8P DR', 'par'],
    ['KC 4R QP DT 8C', 'carta mas alta'],
    ['9C KC KR 7R KP', 'pierna'],
    ['7C KC KT 9P 3T', 'par'],
    ['4R JP 3C QC 3T', 'par'],
    ['JR 9R QT 2P DR', 'carta mas alta'],
    ['3P 3R 4R 5T 7T', 'par'],
    ['7T KR JR KP KP', 'pierna'],
    ['DT 5C 5P 8C DC', 'doble par'],
    ['5P 8C AT 3T 8R', 'par'],
    ['9P 4P 3C KC DC', 'carta mas alta'],
    ['8T DC 6C 2P 4P', 'carta mas alta'],
    ['2T 5T 8P 5T 2T', 'doble par'],
    ['5P QC JT 7T 2P', 'carta mas alta'],
    ['9R 3R 9T AT QT', 'par'],
    ['KP 3P 3C KT JR', 'doble par'],
    ['2T 7T DT 6C KT', 'carta mas alta'],
    ['3T DP JC KT 3R', 'par'],
    ['8C 9T KR 9C AC', 'par'],
    ['2P JR JT DT 4R', 'par'],
    ['3P JC 9P DT 2C', 'carta mas alta'],
    ['7P QR 5R 7T QC', 'doble par'],
    ['4T 8R 4T 7C 7T', 'doble par'],
    ['QT 2T 4P KP DR', 'carta mas alta'],
    ['DP KT 6R 4P KC', 'par'],
    ['5R 6C 7T 6T 4T', 'par'],
    ['DC 4R QC 9P 8T', 'carta mas alta'],
    ['8C JP 5P 5P 3C', 'par'],
    ['QC 8T 5T KR 6P', 'carta mas alta'],
    ['6P JP QP 2R 2T', 'par'],
    ['QC 6C 7R DR 9T', 'carta mas alta'],
    ['5C 4P QT QC 5T', 'doble par'],
    ['3C AR AT JP 8P', 'par'],
    ['DR 6P 7R 8P 5R', 'carta mas alta'],
    ['6R 3R AC QT 9T', 'carta mas alta'],
    ['4R 2C 6P AR 6C', 'par'],
    ['5C JP 7P JP 2C', 'par'],
    ['3T 2C 8R QP 7R', 'carta mas alta'],
    ['4P 6T QP 4C 5P', 'par'],
    ['QR 3C 8T 6R 2P', 'carta mas alta'],
    ['KR 4P 6C 7C 2T', 'carta mas alta'],
    ['7T 8T 3R JT DT', 'carta mas alta'],
    ['4C 7C 8R JC 7P', 'par'],
    ['3T JC DT 6R DT', 'par'],
    ['9P 5R 8P DC 6P', 'carta mas alta'],
    ['QR 4C AP 7C 7T', 'par'],
    ['DP AC 7R 5R 4P', 'carta mas alta'],
    ['QC 6P 5R 3C DP', 'carta mas alta'],
    ['QR KP 5C JC 9C', 'carta mas alta'],
    ['KC 7R QC 9P 9P', 'par'],
    ['8T 7R 2R 3C KR', 'carta mas alta'],
    ['KR DP KT DT AT', 'doble par'],
    ['JR QR 5C AC DP', 'carta mas alta'],
    ['DT 3C 3R 9R QR', 'par'],
    ['KP JP 5R JC 8T', 'par'],
    ['KC 9R 7R 9T 5R', 'par'],
    ['6P 8C 6R AR KR', 'par'],
    ['AP DR 6P 2P 9R', 'carta mas alta'],
    ['6P AR 2P QT 4R', 'carta mas alta'],
    ['6P 5T 8P 6C 4R', 'par'],
    ['8T QT JR AT 7T', 'carta mas alta'],
    ['KT DR 5P 6C 3R', 'carta mas alta'],
    ['KC QP 9T 2P 2T', 'par'],
    ['9C DT JP 8C 9P', 'par'],
    ['JC 3C KT 2R 8C', 'carta mas alta'],
    ['2C 2P DC 8P JP', 'par'],
    ['DT QC JR DT 7R', 'par'],
    ['QC 6P DP QR AR', 'par'],
    ['6T 3P 6R 2T KR', 'par'],
    ['3C 6C AC 9C 7T', 'carta mas alta'],
    ['DT 7T JC 6R 3R', 'carta mas alta'],
    ['7P JR 5P 5T 6T', 'par'],
    ['9R 6C QR 2P 6T', 'par'],
    ['QP 8R 3T 9C 5P', 'carta mas alta'],
    ['DC KC 9C 6C 9P', 'par'],
    ['3R KP QT 5P AR', 'carta mas alta'],
    ['JR 9T 8T 7T 6P', 'carta mas alta'],
    ['9R DP 2T 2T 3R', 'par'],
    ['AC 2P 2R 4T 8C', 'par'],
    ['AP DP QR AC KT', 'par'],
    ['3R QR 2T 4C 9R', 'carta mas alta'],
    ['7T 4T KT 2R 9P', 'carta mas alta'],
    ['4P 5R DR 2P DP', 'par'],
    ['AR 3R KC 5T 7C', 'carta mas alta'],
    ['AT 5R KR AT JR', 'par'],
    ['KP 2T KR DR 8T', 'par'],
    ['JR QP 4P 9P 8P', 'carta mas alta'],
    ['7P 7C AR AP 2C', 'doble par'],
    ['QC 8C DP 8T 5C', 'par'],
    ['JR AT 6T 2C 6T', 'par'],
    ['7C 4R 4T JC 5R', 'par'],
    ['5P 2P DT 9T 6C', 'carta mas alta'],
    ['4P 9P KP AR QT', 'carta mas alta'],
    ['9C 9P KP DT KT', 'doble par'],
    ['JT DR KP KR JP', 'doble par'],
    ['QR 9R QC AT KP', 'par'],
    ['8T JR 9P 8R AT', 'par'],
    ['JC 6C 4P 5T 7C', 'carta mas alta'],
    ['JT QP 7T QC 2R', 'par'],
    ['9T 9P 2T 7R 7C', 'doble par'],
    ['4C QT AR 6P KT', 'carta mas alta'],
    ['AT AR AP QP 3R', 'pierna'],
    ['8R 4T 3R AR 2R', 'carta mas alta'],
    ['6R KT 2C DR 4R', 'carta mas alta'],
    ['AC 8T KR 4C 5T', 'carta mas alta'],
    ['2R 9R KR AT 5C', 'carta mas alta'],
    ['7R 8T 6T AC 3T', 'carta mas alta'],
    ['KT JP JC QP DC', 'par'],
    ['QT 5T 3C JR 9P', 'carta mas alta'],
    ['JC 6C 4C QC 6T', 'par'],
    ['2R 5T 4C 7T 2T', 'par'],
    ['4P 2T 9R 3R JR', 'carta mas alta'],
    ['QC 7T 3T 4P 6R', 'carta mas alta'],
    ['KC 7T 9P JR KC', 'par'],
    ['4T 8T 7T 7P 2C', 'par'],
    ['4T 8C 4T 8R QC', 'doble par'],
    ['DT AC 6T KR 6C', 'par'],
    ['JR DT 3P 3C 6P', 'par'],
    ['JT 9R 2C 6T AP', 'carta mas alta'],
    ['4T 7P 5R JR KC', 'carta mas alta'],
    ['DP JP 4C AT 4R', 'par'],
    ['7R AC 2C 9P 7P', 'par'],
    ['9R 4P 8R 8C 7C', 'par'],
    ['8T 7T 9T 2R 4P', 'carta mas alta'],
    ['4T DP 4P 9C 3R', 'par'],
    ['QT 8R 3R JT KC', 'carta mas alta'],
    ['AP 4C 5C 8C DC', 'carta mas alta'],
    ['2T DT 6T 9C 2C', 'par'],
    ['7T JP 4T 6C 4R', 'par'],
    ['9P DR 3C 2C 2P', 'par'],
    ['QR 9P JC 6C JT', 'par'],
    ['JR 7C 6C 2P JP', 'par'],
    ['DR KP KT 6T 5C', 'par'],
    ['3T AC 8R AT KR', 'par'],
    ['9R DP 3P 5C QP', 'carta mas alta'],
    ['QP AC 8P 3T 8C', 'par'],
    ['8R QC 4P JR JP', 'par'],
    ['4R 7P 7P QT KC', 'par'],
    ['DC 2P JT KP 8T', 'carta mas alta'],
    ['5C 3P 3T 6R 3T', 'pierna'],
    ['DT 3P JP 4P 5R', 'carta mas alta'],
    ['QP JR 8T 6T 6C', 'par'],
    ['JP 2R 2C 6P JT', 'doble par'],
    ['7R 9R 5C AP 6C', 'carta mas alta'],
    ['KR 8P JC 8P JT', 'doble par'],
    ['7T 8R 8T 6R 5T', 'par'],
    ['3T 8T AR KP 7R', 'carta mas alta'],
    ['JP 3C 7P 8R QP', 'carta mas alta'],
    ['8P 4C 7C 5P 5R', 'par'],
    ['KT JP QC 9C AR', 'carta mas alta'],
    ['5R 7C 8P KT KT', 'par'],
    ['KP 9C KP QT JR', 'par'],
    ['2C 2R 8P 3R KP', 'par'],
    ['DC JC 9P 8C AC', 'escalera'],
    ['9T 2R 3R 9P 6P', 'par'],
    ['KT 3C 5C 4T 8R', 'carta mas alta'],
    ['4C 9R 7C 5P 6P', 'carta mas alta'],
    ['QP 9P 6P 2C DR', 'carta mas alta'],
    ['6P 4R AP QP QC', 'par'],
    ['JP DC DT 9P JT', 'doble par'],
    ['3P 8T 8C AR 2R', 'par'],
    ['5P 9P 2T 5R 8T', 'par'],
    ['6R DR 8C DP 6R', 'doble par'],
    ['3T 3R KR KP 3T', 'full'],
    ['DC 6T 5C JT 5T', 'par'],
    ['AR KR AR 2P 4R', 'par'],
    ['6R AC 2C 5P KT', 'carta mas alta'],
    ['5C JC 9T KP 8P', 'carta mas alta'],
    ['4R 8R DC 8C 6P', 'par'],
    ['JP 5C 7C DT 8T', 'carta mas alta'],
    ['QR QR KT 2T KP', 'doble par'],
    ['AT 9R 3T QP 3T', 'par'],
    ['9P 6C AT DT 9C', 'par'],
    ['JP JT 5R 3R KT', 'par'],
    ['9T 7T 8P 2T 4P', 'carta mas alta'],
    ['JP 7R DR 4P 6R', 'carta mas alta'],
    ['8C 5R 7T 7P AP', 'par'],
    ['8C 5C 2R JC 9T', 'carta mas alta'],
    ['AR DT 9C 6T 5R', 'carta mas alta'],
    ['KC 9C KP 6C JP', 'par'],
    ['3C DR DR 3R QT', 'doble par'],
    ['QC KR KT AR JC', 'par'],
    ['5T 4P QR KC DT', 'carta mas alta'],
    ['DT 4C AR 8C 2T', 'carta mas alta'],
    ['8T 7R KR 6T 6T', 'par'],
    ['KC 3T 2T 2R 5P', 'par'],
    ['AP DT QC QT AT', 'doble par'],
    ['3P 8C 4T AR 9P', 'carta mas alta'],
    ['6P 7R 7P AT 3P', 'par'],
    ['DC 8P KP 7R AP', 'carta mas alta'],
    ['7P 4P 3P AR JT', 'carta mas alta'],
    ['6C 7R 2P 5R 8P', 'carta mas alta'],
    ['JT QC 8C 3C 9P', 'carta mas alta'],
    ['AC AC 5C 3C 2P', 'par'],
    ['9P 7R 8T AC 2T', 'carta mas alta'],
    ['8C 7T KR 5T 8P', 'par'],
    ['KR 3R 2P 8P 8P', 'par'],
    ['JR QT 2C 4P 5C', 'carta mas alta'],
    ['3T 2T 3C 5R AP', 'par'],
    ['4P 9C 5T 7C 6R', 'carta mas alta'],
    ['7R 4C 4T QC KC', 'par'],
    ['QT 2P AT JC QP', 'par'],
    ['JT 5P 3C AR 6R', 'carta mas alta'],
    ['JP QP 4T DR DT', 'par'],
    ['KT 4C DC KP 8P', 'par'],
    ['AP 3C 8T 8P QP', 'par'],
    ['7T 9T 9T 4R QP', 'par'],
    ['7R 7T 6P AC 9C', 'par'],
    ['2R 8R 5R DC JR', 'carta mas alta'],
    ['9C 3C 3P 6T 5P', 'par'],
    ['KR KR 3T 7C 2R', 'par'],
    ['KR QC 9C AC 8T', 'carta mas alta'],
    ['3T 5R 4T KR 2C', 'carta mas alta'],
    ['QC 9R DT AP 8C', 'carta mas alta'],
    ['3P JT 4P 4C DP', 'par'],
    ['7R 9R 4T 6P 2C', 'carta mas alta'],
    ['3C 7C 8T KT 8R', 'par'],
    ['2P 2P QT QR 5P', 'doble par'],
    ['KP 2P 8P JR 2R', 'par'],
    ['2T 9R 2T QR KC', 'par'],
    ['9C 3R 7R 3R DP', 'par'],
    ['2P 9P 2T 5P DT', 'par'],
    ['5T 6T QT AT 8R', 'carta mas alta'],
    ['8P 8P 7P DC 3P', 'par'],
    ['KC 2C DC 2P 9P', 'par'],
    ['DC 8R 5T 2T 2P', 'par'],
    ['QP QC AP 9T DT', 'par'],
    ['KT 6T JC 4T 9C', 'carta mas alta'],
    ['AR KR 9P 6T KT', 'par'],
    ['6P 3R 8T 2P 5P', 'carta mas alta'],
    ['3P 2T QP 4T 9P', 'carta mas alta'],
    ['KC KT 9R 3C 6R', 'par'],
    ['3P KC JT 4R JT', 'par'],
    ['3C AR 4C 8P 2T', 'carta mas alta'],
    ['JR 4P 5C 5T 8P', 'par'],
    ['8R 2P 8R QR KR', 'par'],
    ['4T 2P 6R 9R DC', 'carta mas alta'],
    ['2C 7P AC 3P 9T', 'carta mas alta'],
    ['8T 5T 4C QC KP', 'carta mas alta'],
    ['2R 9P JC QP 7C', 'carta mas alta'],
    ['9C 5P AR KP 9T', 'par'],
    ['3R DC 6R 7C AT', 'carta mas alta'],
    ['4P 4R KT 2T KP', 'doble par'],
    ['KC 3R 4T 7T AT', 'carta mas alta'],
    ['DR DP 2C 2R 2P', 'full'],
    ['7R 4T 3C 2C 7P', 'par'],
    ['8C 7P 3P DR 5T', 'carta mas alta'],
    ['KP 4T 5P QC KC', 'par'],
    ['DP 8R 2P 2T 8P', 'doble par'],
    ['AC 3P 2T 9R 7R', 'carta mas alta'],
    ['5C JP 2P AP QC', 'carta mas alta'],
    ['2T 2T JC 5T QP', 'par'],
    ['AP 6R 4R 9R 6P', 'par'],
    ['6C JC 4R 5C 4C', 'par'],
    ['AT 4R 8R 6T 6R', 'par'],
    ['5C 4C 4P 3T QP', 'par'],
    ['8P 9P 7R 8P AC', 'par'],
    ['8P 9R JR JC 3R', 'par'],
    ['9R 9T 9C DC 8C', 'pierna'],
    ['JP 7R DR 6T DT', 'par'],
    ['DR QT DR 6P 8C', 'par'],
    ['DT 6P 7C KC 9C', 'carta mas alta'],
    ['KC 9P 2T 7P 4R', 'carta mas alta'],
    ['5T JP 5C 6C 9R', 'par'],
    ['KT 7T AP QC 2C', 'carta mas alta'],
    ['2T 9T 6T DR AR', 'carta mas alta'],
    ['8T JC KC AP 7R', 'carta mas alta'],
    ['QT 7R KP QP 7C', 'doble par'],
    ['KC 9C AT 4C 3C', 'carta mas alta'],
    ['7R 6P AP 5C AR', 'par'],
    ['3C 5T DT JC QC', 'carta mas alta'],
    ['AC 9R 2T 3P QR', 'carta mas alta'],
    ['4R DR QR AC 4P', 'par'],
    ['2P KP 6C 9T 2R', 'par'],
    ['DT 4C 8P QC KP', 'carta mas alta'],
    ['4T 9P 9P 5C 2R', 'par'],
    ['JT QT JC 6T 9P', 'par'],
    ['3C 3T 8R JR 3C', 'pierna'],
    ['7C 8T 9T 3R 2R', 'carta mas alta'],
    ['4P AC DP 5P 4R', 'par'],
    ['KT 8R 9P QC 6R', 'carta mas alta'],
    ['3P DP 7P JC 7C', 'par'],
    ['QR AC 4C 9R 2R', 'carta mas alta'],
    ['7R JC AP 8T QP', 'carta mas alta'],
    ['4P 8C 5R 4R KT', 'par'],
    ['8C QP 3R 5C 9C', 'carta mas alta'],
    ['6T 9C 8R 2P 6T', 'par'],
    ['KR JT DC 8P 9R', 'carta mas alta'],
    ['5T DC 3T AC 6P', 'carta mas alta'],
    ['DC AR QT KT DR', 'par'],
    ['4T 9T JR QR DR', 'carta mas alta'],
    ['AR 5T KR 6P 2T', 'carta mas alta'],
    ['6P 5R DR 4T AT', 'carta mas alta'],
    ['2T 7C JT AC DP', 'carta mas alta'],
    ['7P 6C AT JP 3C', 'carta mas alta'],
    ['7P 9T 8P 8P 4C', 'par'],
    ['6C DC DR 4P 6R', 'doble par'],
    ['6C 2C 9P JR 7C', 'carta mas alta'],
    ['6R AR 4P 3P 8C', 'carta mas alta'],
    ['2C DC 7C 3P QC', 'carta mas alta'],
    ['6R 3R KR 4C JR', 'carta mas alta'],
    ['9R DT 3P DP KR', 'par'],
    ['JC 3T 6P 7P DP', 'carta mas alta'],
    ['3C JT 5C 5P DC', 'par'],
    ['8C AT 4R 7C 5R', 'carta mas alta'],
    ['9P 5R JC DR 7T', 'carta mas alta'],
    ['8C QT 2T KT 8P', 'par'],
    ['AC 2C JT KC DP', 'carta mas alta'],
    ['QC QT 7T JC 8T', 'par'],
    ['6P DP 3P 8R KP', 'carta mas alta'],
    ['KP 9R AP 6P KC', 'par'],
    ['2T 2C 4C 4T 5P', 'doble par'],
    ['QP 4P AP 3R 6C', 'carta mas alta'],
    ['AC AP 5C QR AP', 'pierna'],
    ['DT 7P JC 7C 4T', 'par'],
    ['AP 9T 8P 7P KR', 'carta mas alta'],
    ['JR 5R 4R KC 7P', 'carta mas alta'],
    ['6P QT 5R KR 4R', 'carta mas alta'],
    ['KT 6C 2T 5R JR', 'carta mas alta'],
    ['8R 7P 6R 9T 2C', 'carta mas alta'],
    ['6R 6P 5P 7T AC', 'par'],
    ['DT AT KP 5C QR', 'carta mas alta'],
    ['9P 4P 3P 2C QT', 'carta mas alta'],
    ['JP 6T 7C 2C JC', 'par']
  ]

  (CASES + RANDOM_CASES.sample(10)).each do |args, result|
    it "returns #{result} to param #{args}" do
      expect(@executor.execute(*args)).to eq result
    end
  end
end
