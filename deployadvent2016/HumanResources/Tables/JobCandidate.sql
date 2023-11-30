CREATE TABLE [HumanResources].[JobCandidate] (
    [JobCandidateID]   INT                                                      IDENTITY (1, 1) NOT NULL,
    [BusinessEntityID] INT                                                      NULL,
    [Resume]           XML(CONTENT [HumanResources].[HRResumeSchemaCollection]) NULL,
    [ModifiedDate]     DATETIME                                                 CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED ([JobCandidateID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID]
    ON [HumanResources].[JobCandidate]([BusinessEntityID] ASC);

