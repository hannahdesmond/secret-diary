require 'secret_diary'

describe SecretDiary do

  let(:words){ double :words}
  let(:date){ double :date}

  it 'should be locked as default' do
    expect(subject.locked).to eq(true)
  end
  describe '#unlock' do
    it 'unlocks the diary' do
      subject.unlock
      expect(subject.locked).to eq(false)
    end
    describe '#lock' do
      it 'locks the diary' do
        subject.unlock
        subject.lock
        expect(subject.locked).to eq(true)
      end
    end
  end
    describe '#get_entries' do
      it 'raises an error if diary is locked' do
        subject.locked
        expect { subject.get_entries }.to raise_error("Get your grubby mits off this locked diary!")
      end
      it 'shows entries' do
        subject.unlock
        subject.instance_variable_set(:@entries,[{date=>words}] )
        expect { subject.get_entries}.to output("#{date}: #{words}\n").to_stdout
      end
    end
    describe '#add_entry' do
      it 'raises and error if diary is locked' do
        subject.locked
        expect { subject.add_entry(date, words) }.to raise_error("Get your grubby mits off this locked diary!")
      end
      it 'adds the entry to a collection of entries' do
        subject.unlock
        subject.add_entry(date, words)
        expect(subject.entries).to eq([date=>words])
      end

      end
    end
