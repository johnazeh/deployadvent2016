CREATE TABLE [Person].[Person] (
    [BusinessEntityID]      INT                                                           NOT NULL,
    [PersonType]            NCHAR (2)                                                     NOT NULL,
    [NameStyle]             [dbo].[NameStyle]                                             CONSTRAINT [DF_Person_NameStyle] DEFAULT ((0)) NOT NULL,
    [Title]                 NVARCHAR (8)                                                  NULL,
    [FirstName]             [dbo].[Name]                                                  NOT NULL,
    [MiddleName]            [dbo].[Name]                                                  NULL,
    [LastName]              [dbo].[Name]                                                  NOT NULL,
    [Suffix]                NVARCHAR (10)                                                 NULL,
    [EmailPromotion]        INT                                                           CONSTRAINT [DF_Person_EmailPromotion] DEFAULT ((0)) NOT NULL,
    [AdditionalContactInfo] XML(CONTENT [Person].[AdditionalContactInfoSchemaCollection]) NULL,
    [Demographics]          XML(CONTENT [Person].[IndividualSurveySchemaCollection])      NULL,
    [rowguid]               UNIQUEIDENTIFIER                                              CONSTRAINT [DF_Person_rowguid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]          DATETIME                                                      CONSTRAINT [DF_Person_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [city]                  VARCHAR (50)                                                  NULL,
    CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Person_rowguid]
    ON [Person].[Person]([rowguid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Person_LastName_FirstName_MiddleName]
    ON [Person].[Person]([LastName] ASC, [FirstName] ASC, [MiddleName] ASC);


GO
CREATE PRIMARY XML INDEX [PXML_Person_AddContact]
    ON [Person].[Person]([AdditionalContactInfo])
    WITH (PAD_INDEX = OFF);


GO
CREATE PRIMARY XML INDEX [PXML_Person_Demographics]
    ON [Person].[Person]([Demographics])
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [XMLPATH_Person_Demographics]
    ON [Person].[Person]([Demographics])
    USING XML INDEX [PXML_Person_Demographics] FOR PATH
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [XMLPROPERTY_Person_Demographics]
    ON [Person].[Person]([Demographics])
    USING XML INDEX [PXML_Person_Demographics] FOR PROPERTY
    WITH (PAD_INDEX = OFF);


GO
CREATE XML INDEX [XMLVALUE_Person_Demographics]
    ON [Person].[Person]([Demographics])
    USING XML INDEX [PXML_Person_Demographics] FOR VALUE
    WITH (PAD_INDEX = OFF);

