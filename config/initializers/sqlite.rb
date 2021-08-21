if ::ActiveRecord::Base.connection_config[:adapter] == 'sqlite3'
  if c = ::ActiveRecord::Base.connection
    # see http://www.sqlite.org/pragma.html for details

    # Setting of the "synchronous" flag, "NORMAL" means sync less often but still more than none
    c.execute 'PRAGMA main.synchronous=NORMAL;'

    # Journal mode for database, WAL=write-ahead log
    c.execute 'PRAGMA main.journal_mode=WAL;'

    # Storage location for temporary tables, indices, views, triggers
    c.execute 'PRAGMA main.temp_store = MEMORY;'
    c.execute 'PRAGMA mmap_size = 30000000000;'
  end
end