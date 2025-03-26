/*
  Warnings:

  - The `demandLevel` column on the `IndustryInsight` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `marketOutlook` on the `IndustryInsight` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "DemandLevel" AS ENUM ('HIGH', 'MEDIUM', 'LOW');

-- CreateEnum
CREATE TYPE "MarketOutlook" AS ENUM ('POSITIVE', 'NEUTRAL', 'NEGATIVE');

-- DropIndex
DROP INDEX "Assessment_userId_idx";

-- DropIndex
DROP INDEX "CoverLetter_userId_idx";

-- DropIndex
DROP INDEX "IndustryInsight_industry_idx";

-- AlterTable
ALTER TABLE "IndustryInsight" DROP COLUMN "demandLevel",
ADD COLUMN     "demandLevel" "DemandLevel" NOT NULL DEFAULT 'HIGH',
DROP COLUMN "marketOutlook",
ADD COLUMN     "marketOutlook" "MarketOutlook" NOT NULL;

-- DropEnum
DROP TYPE "demandLevel";

-- DropEnum
DROP TYPE "marketOutlook";

-- CreateIndex
CREATE INDEX "Assessment_userId_category_idx" ON "Assessment"("userId", "category");

-- CreateIndex
CREATE INDEX "CoverLetter_userId_status_idx" ON "CoverLetter"("userId", "status");

-- CreateIndex
CREATE INDEX "IndustryInsight_demandLevel_marketOutlook_idx" ON "IndustryInsight"("demandLevel", "marketOutlook");

-- CreateIndex
CREATE INDEX "IndustryInsight_growthRate_idx" ON "IndustryInsight"("growthRate");

-- CreateIndex
CREATE INDEX "User_industry_idx" ON "User"("industry");
