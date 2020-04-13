-- 创建触发器
if exists(select *
          from dbo.sysobjects
          where id = object_id(N'[dbo].[RASCNCTR_TGR_MBR]')
                and OBJECTPROPERTY(id, N'IsTrigger') = 1)
  drop trigger RASCNCTR_TGR_MBR
go

CREATE TRIGGER [RASCNCTR_TGR_MBR]
  ON [dbo].[MemberGuest]
  AFTER INSERT , UPDATE , DELETE AS --
  if exists(select 1
            from inserted) and not exists(select 1
                                          from deleted) -- insert
    BEGIN
      INSERT INTO BAASCNCTR_LOG (ACTION, TABLENAME, PK)
        select 'I', 'MBR', MemberID
        from inserted
        where  Status = 1;
    END
if exists(select 1
          from inserted) and exists(select 1
                                    from deleted) and
   (update(MemberID) or update(MOBILE) or update(GuestName) or update(GuestSex) or update(BirthDay) or update(Status))-- update
  BEGIN
    INSERT INTO BAASCNCTR_LOG (ACTION, TABLENAME, PK)
      select 'U', 'MBR', MemberID
      from deleted
      where  Status = 1
      union
      select 'U', 'MBR', MemberID
      from inserted
      where  Status = 1;
  END
if not exists(select 1
              from inserted) and exists(select 1
                                        from deleted) -- delete
  BEGIN
    INSERT INTO BAASCNCTR_LOG (ACTION, TABLENAME, PK) select 'D', 'MBR', MemberID from deleted where  Status = 1;
  END
go