CREATE TABLE [Sales].[ShoppingCartItem] (
    [ShoppingCartItemID] INT           IDENTITY (1, 1) NOT NULL,
    [ShoppingCartID]     NVARCHAR (50) NOT NULL,
    [Quantity]           INT           CONSTRAINT [DF_ShoppingCartItem_Quantity] DEFAULT ((1)) NOT NULL,
    [ProductID]          INT           NOT NULL,
    [DateCreated]        DATETIME      CONSTRAINT [DF_ShoppingCartItem_DateCreated] DEFAULT (getdate()) NOT NULL,
    [ModifiedDate]       DATETIME      CONSTRAINT [DF_ShoppingCartItem_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID] PRIMARY KEY CLUSTERED ([ShoppingCartItemID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID]
    ON [Sales].[ShoppingCartItem]([ShoppingCartID] ASC, [ProductID] ASC);

