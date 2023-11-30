CREATE TABLE [Production].[ProductModel] (
    [ProductModelID]     INT                                                            IDENTITY (1, 1) NOT NULL,
    [Name]               [dbo].[Name]                                                   NOT NULL,
    [CatalogDescription] XML(CONTENT [Production].[ProductDescriptionSchemaCollection]) NULL,
    [Instructions]       XML(CONTENT [Production].[ManuInstructionsSchemaCollection])   NULL,
    [rowguid]            UNIQUEIDENTIFIER                                               CONSTRAINT [DF_ProductModel_rowguid] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]       DATETIME                                                       CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED ([ProductModelID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_Name]
    ON [Production].[ProductModel]([Name] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_rowguid]
    ON [Production].[ProductModel]([rowguid] ASC);


GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
    ON [Production].[ProductModel]([CatalogDescription])
    WITH (PAD_INDEX = OFF);


GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_Instructions]
    ON [Production].[ProductModel]([Instructions])
    WITH (PAD_INDEX = OFF);

