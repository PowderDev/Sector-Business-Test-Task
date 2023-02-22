/*
  Warnings:

  - You are about to alter the column `createdAt` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - A unique constraint covering the columns `[refreshToken]` on the table `Token` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `User` MODIFY `createdAt` TIMESTAMP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Token_refreshToken_key` ON `Token`(`refreshToken`);
