/****** Script para fazer tabela de relações dos dados simulados dentro do SQL Server  ******/
USE [pia]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[agencias](
	[agencia] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_agencia] PRIMARY KEY CLUSTERED 
(
	[agencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[agencias]
SELECT DISTINCT([agencia])
  FROM [dbo].[info_agencia]
  ORDER BY 1
GO