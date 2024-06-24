describe 'Matcher output' do
  it { expect { puts 'Bruno' }.to output.to_stdout } # saída padrão
  it { expect { print 'Bruno' }.to output('Bruno').to_stdout } # saída padrão
  it { expect { puts 'Bruno Lima' }.to output(/Bruno/).to_stdout }  # saída padrão usando regex

  it { expect { warn 'Bruno' }.to output.to_stderr } # saída padrão erro
  it { expect { warn 'Bruno' }.to output("Bruno\n").to_stderr } # saída padrão erro
  it { expect { warn 'Bruno Lima' }.to output(/Bruno/).to_stderr } # saída padrão erro usanbdo regex
end
